/*********************************************************************************************************
John Behman
ECE 474 Homework #4
fifo.sv
fifo module that allows for read and write of data to a memory array using different read and write clocks
**********************************************************************************************************/

module fifo(

input 		 wr_clk,   //write clock
input 		 rd_clk,   //read clock 
input 		 reset_n,  //reset async active low
input   	 wr, 	   //write enable
input		 rd, 	   //read enable
input 	   [7:0] data_in,  //data_in
output reg [7:0] data_out, //data out
output logic 	 empty,    //empty flag
output logic 	 full 	   //full flag
    
);    


reg [7:0] mem [7:0]; 	//2D array of memory (8 X 8)
logic [2:0] rd_ptr = 0; //initialize read pointer to zero
logic [2:0] wr_ptr = 0; //initialize write pointer to zero
logic empty_val = 0; 	//initiaize empty_val to zero
logic empty_sync = 0; 	//initialize empty_sync to zero


always_ff @ (posedge rd_clk, negedge reset_n) begin //read flip flop
	if(!reset_n) 				//default statement for reset of the flip flop
	rd_ptr <= 0;

	else begin
	    	
	    if(rd == 1) begin 			//if read is asserted, perform the read operation
		data_out <= 0; //TEST
		if(rd_ptr == 7) begin 		//if read pointer is at the bottom of the memory array:
		    rd_ptr <= 0; 		//set the pointer to zero
		    data_out <= mem[rd_ptr]; 	//set the output to the data in the memory location of the pointer
		    empty_val <= !empty_val; 	//flip the empty value
		end

		else begin 			//if read pointer does not equal 7:
		    rd_ptr <= rd_ptr + 1; 	//increment read pointer	    
		    data_out <= mem[rd_ptr]; 	//set data out to the memory array at that pointer value 
		end

	    end
	
	else rd_ptr <= rd_ptr; 			//if read is not asserted, do nothing
    
    	end	

	end


always_ff @ (posedge wr_clk, negedge reset_n) begin //write flip flop
	if(!reset_n) 				//default statement for reset of the flip flop
	    wr_ptr <= 0;
	else begin
	    if(wr == 1) begin 			//if write is asserted, perform the write operation
		if(wr_ptr == 7)begin 		//if write pointer is at the bottom of the memory array:
		    wr_ptr <= 0; 		//set the pointer to zero
		    mem[wr_ptr] <= data_in; 	//set memory location of the pointer to the input data
		    empty_sync <= !empty_sync; 	//flip the empty_sync value
		end
		    
		else begin 			//if write pointer does not equal 7:
		    wr_ptr <= wr_ptr + 1; 	//increment write pointer		
		    mem[wr_ptr] <= data_in; 	//set memory location of the pointer to the input value
		end
	    end
	    
	    else wr_ptr <= wr_ptr;		//if write is not asserting, do nothing

    	end

	end


always_comb begin //comb block for calculation of the full and empty signals
	
    	empty = (empty_val == empty_sync) && (rd_ptr == wr_ptr); 	//empty calculation based on current location of the pointers and their toggle values
									//if val and sync are quivalent, we have written and reas the entire array so it is empty

	full = (empty_val != empty_sync) && (rd_ptr == wr_ptr);  	//full calculation based on current location of pointers and their toggle values
									//if val and sync aren't equal, the memory array has either not fully written or
									// read so there is data in the memory
end    

endmodule

