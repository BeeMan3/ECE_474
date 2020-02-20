
module operations(
input reset,
input clk,
input start,
input [31:0] a_in,
input [31:0] b_in,
input [1:0] state,
input [5:0] counter,
output logic [63:0] product,
output logic done
);

reg [63:0] temp_a;
reg [31:0] temp_b;
reg [63:0] product_reg;

always_ff @(posedge clk, negedge reset)
//temp = in_a;
	if(!reset) temp_b <= temp_b;
	    else begin

    case(state)

	3'b000: begin
	done <= 1;
	//product <= 0;
	product_reg <= 0;
	end


	3'b001: begin
	if(counter == 0)
    	begin
	product <= 0;
	end	    

	done <= 0;
       	temp_a <= a_in << counter;
	product <= product_reg;	
	end

	
	3'b010: begin
	//done <= 0;    
	temp_b <= b_in >> counter;
	product <= product_reg;
	end


	3'b011: begin
	//done <= 0;
	product_reg <= product_reg + temp_a;
       	product <= product_reg;	
	end

	3'b100: begin
	//product <= 0;
	//done <= 1; testing
	product_reg <= 0;
	temp_a <= 0;
	temp_b <= 0;


	end

	endcase

    end
endmodule


