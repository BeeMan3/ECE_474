

module tas (
    input clk_50,  	    //50Mhz input clock
    input clk_2,   	    //2Mhz input clock
    input reset_n, 	    //reset active low
    input serial_data,      //serial data enable
    input data_ena, 	    //serial data enable
    output logic ram_wr_n,        //write to ram
    output logic [7:0] ram_data,  //ram data
    output logic [10:0] ram_addr  //ram address
    );

//state machine states
enum reg {FULL_AND_HEADER = 1'b0, AVERAGE_AND_OUTPUT = 1'b1} prev_state, next_state;

//additional values
reg [7:0] mem [4:0];
reg [7:0] data_in = 0;
logic [3:0] count = 0;
logic [4:0] fifo_count = 0;
logic full = 0;
logic [7:0] header = 0;
logic fifo_stall = 0;
logic [10:0] temp_address = 11'h7FF;
logic [9:0] temp_data;

//50 Mhz flip flop
    always_ff @(posedge clk_50) begin

	header <= mem[0]; //header assigned to top cell in FIFO

	if(fifo_count > 4) begin //resets fifo pointer if count gets past 4
	    fifo_count <= 0;
	    full <= 1; //if count increments past 4, FIFO is full
	end

	else full <= full + full - full; //do nothing otherwise

	if(data_ena == 1) begin	//only runs data input if data_ena == 1

	if(count == 7) begin //if one byte of the packet has been sent
	    data_in[count] <= serial_data; //set shift register to derial data input for 8th bit
	    count <= 0; //reset count in shift register
	    fifo_stall <= 1; //value set for fifo data input
	    				

	end

	else begin
	    data_in[count] <= serial_data; //otherwise set current bit in shift register to serial data input
	    count <= count + 1;            //and increment pointer for shift register
	end
	end

	else begin //if data_ena != 1
	    if(fifo_stall == 1) begin //if a full byte has been written to shift register 
		mem[fifo_count] <= data_in; //set current index of FIFO to data in shift register
		fifo_count <= fifo_count + 1; //increment FIFO pointer
		fifo_stall <= 0; //reset fifo_stall
	    
		if(fifo_count < 5) begin //if FIFO pointer isn't past the last index, FIFO isn't full
		    full <= 0;

		end


		else full <= full - full + full; //otherwise do nothing
		
	    
	    end
	
	    
	    else begin

		count <= count + count - count; //otherwise do nothing

	    end

	end
    end

    //2 Mhz flip flop for state machine
    always_ff @(posedge clk_2, negedge reset_n) begin //state machine decleration
	if(!reset_n) prev_state <= FULL_AND_HEADER; //when reset go to default state
	else prev_state <= next_state; 
	
    end

    always_comb begin //state machine states

	unique case (prev_state) 
	
	default: 
    		begin
		    //if the FIFO is full and the header (index 0) is A5 or C3, then move to next state
		    if(full == 1 && (header == 8'hA5 || header == 8'hC3)) next_state = AVERAGE_AND_OUTPUT;
		    
		    else next_state = FULL_AND_HEADER;
		end	
	
	AVERAGE_AND_OUTPUT:
	    	begin
		    //after averaging and outputting to ram, move back to default state
		    next_state = FULL_AND_HEADER;
		end
	endcase 

    end


    always_comb begin

	unique case(next_state) //case statement for next state logic

	//all data values set to themselves if not utilized to avoid latches
	//when compiling into gate level design
	FULL_AND_HEADER: //default state logic
    		begin
		
		ram_addr = ram_addr - 1 + 1;	
		
		if(!full) begin //if not full, don't write to ram
		    ram_wr_n = 0; 
		    temp_address = temp_address - 1 + 1;
		    ram_data = ram_data - 1 + 1;
	

		end

		else begin //else do nothing
		    ram_wr_n = ram_wr_n - ram_wr_n + ram_wr_n;
		    temp_address = temp_address - 1 + 1;
		    ram_data = ram_data - 1 + 1;

		end
	    end

	AVERAGE_AND_OUTPUT: //averaging and ram output state logic
	    	begin
		    //add temperature data together and then obtain the average
		    //which is contained in the upper 8 bits of the added indexes
		    temp_data = mem[1] + mem[2] + mem[3] + mem[4];
		    ram_data = temp_data[9:2];
 

		    ram_addr = temp_address; //assign current address to ram_addr output

		    if(temp_address == 0) begin //if temp address is 0, set it back to 7FF
			temp_address = 11'h7FF;
			ram_wr_n = ram_wr_n - ram_wr_n + ram_wr_n;
			temp_address = temp_address - 1 + 1;
			ram_data = ram_data - 1 + 1;

		    end

		    if(data_ena) begin //if data_ena asserted, decrement the address
			temp_address = temp_address - 1;
			ram_wr_n = ram_wr_n - ram_wr_n + ram_wr_n;
			ram_data = ram_data - 1 + 1;

		    end

		    else begin //otherwise, do nothing
			temp_address = temp_address - 1 + 1;
			ram_wr_n = ram_wr_n - ram_wr_n + ram_wr_n;
		    end


		    if(full) begin //if FIFO is full
			ram_wr_n = 1; //write to memory
			temp_address = temp_address - 1 + 1;
			ram_data = ram_data - 1 + 1;

		    end

		    else begin //otherwise do nothing
			temp_address = temp_address - 1 + 1; 
			ram_wr_n = ram_wr_n - ram_wr_n + ram_wr_n;
			ram_data = ram_data - 1 + 1;

		    end


		end

	endcase
    	
    end

endmodule


