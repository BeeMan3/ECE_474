module mult_state(output logic [1:0] state,reg [5:0] counter, //made counter 6 bit
    		  input start, clk, reset, [31:0] b_in);

enum reg [2:0]{IDLE = 3'b000, SHIFT_TEMP = 3'b001, SHIFT = 3'b010, 
	       ADD = 3'b011, RESET = 3'b100} prev_state, next_state;  
reg lsb;
reg [31:0] temp;
//reg [6:0] counter_reg;


always_ff @(posedge clk, negedge reset)
	if(!reset) prev_state <= IDLE;
	else	     prev_state <= next_state;

always_comb begin
	state = IDLE;

	unique case (prev_state)

	default:
	begin       
	//counter_reg = 0;
	counter = 0;

	if(start) begin //&& ... is TEST
	next_state = SHIFT_TEMP;
	state = SHIFT_TEMP;

	end

	else begin
	next_state = IDLE;
	state = IDLE;

	end	    

      	end	



	SHIFT_TEMP:
	
	begin
	
	temp = b_in >> counter;
	lsb = temp[0];	    
	counter = counter +1;
	//counter = counter_reg;

	if(lsb && counter < 6'h20) begin
	next_state = ADD;
	state = ADD;
	end

	else if(counter == 6'h20) begin //this if is a test
	next_state = RESET;
	state = RESET;

	end

	else begin
	next_state = SHIFT;
	state = SHIFT;
	end	    

      	end	



	SHIFT:
	begin      

	next_state = SHIFT_TEMP;
	state = SHIFT_TEMP;
	//counter = counter + 1;

      	end	



	ADD:
	begin       
	//if(counter == 6'h20) begin   
	//next_state = RESET;
	//state = RESET;
	//end

	//else begin
	next_state = SHIFT_TEMP;
	state = SHIFT_TEMP;

	//end	    

      	end	


	RESET: //all RESET stuff is test
	begin
	if(reset == 0)begin
	next_state = IDLE;
	state = IDLE;
	end    

	else begin
	next_state = RESET;
	state = RESET;
	end

	end

	endcase
   end
endmodule



