//John Behman
//HW #5
//ModelSim simulation produces final output at 431000 ns


module gcd( //module operands
    input [31:0] a_in, //input a
    input [31:0] b_in, //input b
    input start, //start value initiates state machine
    input reset_n, //resets state machine
    input clk, //clock input
    output reg [31:0] result, //gcd output result
    output reg done //asserted when completed
);

//state values
enum reg [1:0]{IDLE = 2'b00, GCD_CTRL = 2'b01, GCD = 2'b10, DONE = 2'b11} prev_state, next_state; 

reg [31:0] DLI_reg; //Lower value determined stored here
reg [31:0] sub; //subtract output
reg [31:0] gcd_temp; //temp register used to determine gcd
logic num;


always_ff @(posedge clk, negedge reset_n) begin //state machine ff
    if(!reset_n) prev_state <= IDLE;
    else       prev_state <= next_state;

end

always_comb begin //state logic

    	unique case (prev_state)

    	default: //default case idle
    		begin
		
		    if(start) next_state = GCD_CTRL; //if start is set, next state becomes GCD_CTRL
	
		    else next_state = IDLE; //otherwide remain in IDLE


	
	
			   
    		end

    GCD_CTRL:
    		begin
		
		    if(!sub) next_state = DONE; //if sub==0, gcd operation is done
		
		    else next_state = GCD; //otherwise continue


			   
    		end

    GCD:	
    		begin
		   
		   next_state = GCD_CTRL; //always go to GCD_CTRL


			   
		end


    DONE: 
		begin
	
		    next_state = IDLE; //always go to IDLE


			   
		end

	
	endcase

end



always_comb begin

    	//values of all registers and logic are asserted to a value in each state
	//this avoids inferred latches from the gate level compiler
	unique case(next_state)

	IDLE: //initialize values in idle
		begin 
		    num = 0;
		    done = 0;
		    sub = 1; 
		    DLI_reg = 0;
		    gcd_temp = 0;
		    result = result - result + result; 
	

			   
		end

	GCD_CTRL: 
		begin //all values asserted to = themselve
		      //avoids inferred values in combinatorial logic
		    num = num - num + num;
		    done = done - done + done;
		    sub = sub - sub + sub;
		    DLI_reg = DLI_reg - DLI_reg + DLI_reg;
		    result = result - result + result; 

		end


	GCD:
		begin
		    done = done - done + done;
		    DLI_reg = DLI_reg - DLI_reg + DLI_reg;
		    result = result - result + result;

		    if(!num) //if num is zero perform this operation
			     //num is zero on the first run through GCD 
			     //allowing subtraction of b_in and a_in
			begin
			    
			    //if a is greater then b subtract b from a
			    if(a_in > b_in) begin 
				sub = a_in - b_in;
				DLI_reg = b_in; //set DLI_reg to smaller value b

			    end

			    else begin //else subtract b from a
				sub = b_in - a_in; 
				DLI_reg = a_in; //set DLI_reg to smaller value a
			    end

	    		    num = 1; //assert num 
			end


		    else  //num is then asserted to 1 and the GCD operation is performed
			  //on sub and DLI_reg for the rest of the GCD loop
		   	begin
			   
			   num = num - num + num;
			   
			   //if sub greater than DLI_reg subtract DLI_reg from sub
			   if(sub > DLI_reg) begin 
				sub = sub - DLI_reg;	
		
			   end

			   //if sub less than DLI_reg subtract sub from DLI_reg
			   if(sub < DLI_reg) begin
			        gcd_temp = sub; //sub value saved since sub is being modified
						//and sub is the lower value needed for GCD_CTRL
				sub = DLI_reg - sub; 
				DLI_reg = gcd_temp; //DLI_reg assigned the original sub value 


			   end

			   //if they are equivalent, the gcd operation has completed and
			   //sub is set to zero, sending the state machine to DONE
			   if(DLI_reg == sub) sub = 0; 

			   //otherwise, do nothing 
			   else begin
			       DLI_reg = DLI_reg;
			   
			       sub = sub - sub + sub;
			   end
		end


			   

		end


	DONE:
		begin
		
		    done = 1; //done asserted in DONE state
		    result = DLI_reg; //result set to DLI_reg value containing the 
		    		      //final gcd calculated

		    //set values to avoid latches
		    num = 0; 
		    sub = 0;
		    DLI_reg = 0;	   

		end


	endcase






end




endmodule



