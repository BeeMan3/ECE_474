
module mult(
input [31:0] a_in,
input [31:0] b_in,
input start,
input clk,
input reset,
output logic [63:0] product,
output logic done


);

//logic clk;
logic [5:0] counter;
logic [1:0] state;


mult_state ms(
	.state(state),
	.counter(counter),
	.start(start),
	.clk(clk),
	.reset(reset),
	.b_in(b_in)

);


operations mlt(	
	.state(state),
	.counter(counter),
	.start(start),
	.clk(clk),
	.reset(reset),
	.a_in(a_in),
	.b_in(b_in),
	.product(product),
	.done(done)
);    

endmodule

