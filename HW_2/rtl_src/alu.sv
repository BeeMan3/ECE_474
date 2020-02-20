

module alu(
	input	[7:0] in_a, //input a
	input	[7:0] in_b, //input b
	input	[3:0] opcode, //opcode input
	output reg [7:0] alu_out, //alu output
	output reg	 alu_zero, //logic '1' when alu_output [7:0] is all zeros
        output reg	 alu_carry //indicates a carry out from ALU
	);

//11 paramaters needed for ALU

parameter c_add =  4'h1;
parameter c_sub =  4'h2;
parameter c_inc =  4'h3;
parameter c_dec =  4'h4;
parameter c_or =  4'h5;
parameter c_and =  4'h6;
parameter c_xor =  4'h7;
parameter c_shr =  4'h8;
parameter c_shl =  4'h9;
parameter c_onescomp =  4'hA;
parameter c_twoscomp =  4'hB;
reg [7:0] temp; //8bit temp register
reg [7:0] temp2; //8bit temp register
reg [8:0] temp_add; //9bit temp register used int he add operation
logic X;

always_comb begin

case(opcode)


	c_add:
	begin
		temp_add = in_a + in_b; //adds the inputs together
		alu_carry = temp_add[8]; //highest bit it temp_add is the carry
		alu_out = temp_add[7:0]; //lower 8 bits are the value
		//if(alu_out == 0) alu_zero = 1;
		//else alu_zero = 0;	       

	alu_zero = (alu_out == 0); //if the output is zero, alu_zero is 1

	end

	c_sub:
	begin
		if(in_a < in_b) begin
		alu_carry = 1; 
		//alu_zero = 0;
		//alu_out = in_a - in_b;

	end

		//else if(in_a == in_b) begin
		//alu_carry = 0;
		//alu_zero = 1;
		//alu_out = in_a - in_b;


	//end

		//else if(in_a > in_b) begin
		//alu_carry = 0;
		//alu_zero = 0;
		//alu_out = in_a - in_b;

	//end

	else alu_carry = 0;
	
	

	alu_out = in_a - in_b;
	alu_zero = (alu_out == 0);

	end

	c_inc:
	begin
		temp = 8'b11111111;
		if(in_a == temp) //if FF, generate a carry and output 0
   	begin 
		alu_carry = 1;
		//alu_zero = 1;
		alu_out = 0;
		
	end		

		else
	begin	
		alu_carry = 0; //otherwise increment normally and there is no carry 
		//alu_zero = 0;
		alu_out = in_a + 1;
	end


	alu_zero = (alu_out == 0);
		

	end

	c_dec:
	begin
		

		if(in_a == 1) //if inputting 1, output and zero are 0
   	begin 
		//alu_zero = 1;
		alu_out = 0;
		alu_carry = 0;
	end	


		else if(in_a == 0) //if decrementing 0, output is FF with carry
	begin
		//alu_zero = 0;
		alu_carry = 1;
		alu_out = 8'b11111111;
	end

		
		else
	begin
		//alu_zero = 0;
		alu_carry = 0; //otherwise normal operation occurs
		alu_out = in_a - 1;
	end


	alu_zero = (alu_out == 0);
		

	end

	c_or:
	begin
		//if((in_a == 0) && (in_b == 0)) alu_zero = 1;
		//else alu_zero = 0;

		alu_carry = 0;
		alu_out = (in_a | in_b); //or the inputs together
		

	alu_zero = (alu_out == 0);
	end
	

	c_and:
	begin
	    	alu_out = in_a & in_b; //and the inputs

		//temp = in_a & in_b;
		//if(temp == 8'b00000000) alu_zero = 1;
		//else alu_zero = 0;

		alu_carry = 0;

		alu_zero = (alu_out == 0);
	end

	c_xor:
	begin
		temp = in_a ^ in_b; //xor the inputs together
		//if(temp == 8'b00000000) alu_zero = 1;
		//else alu_zero = 0;	

		alu_carry = 0;
		alu_out = (in_a ^ in_b);


	alu_zero = (alu_out == 0);
	end

	c_shr:
	begin
		//if((in_a == 1) | (in_a == 0)) alu_zero = 1;	
		//else alu_zero = 0;

		alu_carry = in_a[0]; //carry becomes the shifted out value
		alu_out = (in_a >> 1); //shift in_a 1 to the right


	alu_zero = (alu_out == 0);
	end

	c_shl:
	begin
		//if((in_a == 128) | (in_a == 0)) alu_zero = 1;
		//else alu_zero = 0;

		alu_carry = in_a[7]; //carry becomes the shifted out value
		alu_out = (in_a << 1); //shift in_a 1 to the left


	alu_zero = (alu_out == 0);
	end

	c_onescomp:
	begin
		temp = 8'b11111111;	
		//if(in_a == temp) alu_zero = 1;
		//else alu_zero = 0;	
	
		alu_carry = 0;
		alu_out = (in_a ^ temp); //xor with all 1's to take 1's complement


	alu_zero = (alu_out == 0);

	end

	c_twoscomp:
	begin
		
		temp = 8'b11111111;
		temp2 = (in_a ^ temp); //ones complement

		
		if(temp2 == 8'b11111111) //if all 1's the increment will generate a carry and output 0
     	begin
      		alu_carry = 1;
		//alu_zero = 1;
		alu_out = 0;
	end

	else //otherwise, normal operation 
        begin
		alu_carry = 0; 
		//alu_zero = 0;
		alu_out = temp2 + 1;
	end
		 


	alu_zero = (alu_out == 0);
	end


	default: //default case accounts for other opcode inputs that arent the designated ones
    	begin
		alu_out = X;
		alu_carry = X;
		alu_zero = X;

    	end



   endcase
end

endmodule



