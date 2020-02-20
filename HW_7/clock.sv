
module clock(
    input reset_n,  //reset pin
    input clk_1sec, //1 sec clock
    input clk_1ms,  //1 mili sec clock
    input mil_time, //mil time pin
    output reg [6:0] segment_data, //segment data output
    output reg [2:0] digit_select //current digit output
);

enum reg [2:0]{ZERO = 3'b000, ONE = 3'b001, TWO = 3'b010, THREE = 3'b011, FOUR = 3'b100} prev_state, next_state;

logic [5:0] s_counter = 0; //seconds counter
logic [5:0] m_counter = 0; //minutes counter
logic [4:0] h_counter = 0; //hours counter
logic [5:0] data_temp;     //temp data value
logic [6:0] col = 7'b1111111; //colon output data
logic pm = 0; //pm flag
logic temp;   //temp variable


//State Machine FLip-Flop
always_ff @(posedge clk_1ms, negedge reset_n) begin
    if(!reset_n) prev_state <= ZERO;
    else prev_state <= next_state;
end

//State Machine Logic
always_comb begin

    unique case (prev_state)

    default: begin	
	digit_select = 0;
	next_state = ONE;
    end

    ONE: begin
	digit_select = 1;
	next_state = TWO;
    end

    TWO: begin
	digit_select = 2;
	next_state = THREE;
    end

    THREE: begin
	digit_select = 3;
	next_state = FOUR;
    end

    FOUR: begin
	digit_select = 4;
	next_state = ZERO;
    end

endcase
end

//Digit Select Output
always_comb begin
    unique case(digit_select)
    3'b000: data_temp = (m_counter % 10); //minutes mod ten is 1s place
    3'b001: data_temp = (m_counter / 10); //minutes divided by 10 is 10s place
    3'b010: data_temp = 10; 		  //colon status
    3'b011: data_temp = (h_counter % 10); //hours mod ten is 1s place
    3'b100: data_temp = (h_counter / 10); //minutes divided by 10 is 10s place

    endcase
end

//Decoder
always_comb begin
    unique case(data_temp)

    //assuming active high seven segment display
    4'b0000: segment_data = 7'b1111110; //displays 0 on seven seg
    4'b0001: segment_data = 7'b0110000; //displays 1 on seven seg
    4'b0010: segment_data = 7'b1101101; //displays 2 on seven seg
    4'b0011: segment_data = 7'b1111001; //displays 3 on seven seg
    4'b0100: segment_data = 7'b0110011; //displays 4 on seven seg
    4'b0101: segment_data = 7'b1011011; //displays 5 on seven seg
    4'b0110: segment_data = 7'b1011111; //displays 6 on seven seg
    4'b0111: segment_data = 7'b1110000; //displays 7 on seven seg
    4'b1000: segment_data = 7'b1111111; //displays 8 on seven seg
    4'b1001: segment_data = 7'b1110011; //displays 9 on seven seg
    4'b1010: segment_data = col; //displays all 1's or 0's for the colon index 
    default: segment_data = 7'b0000000; //default case all off

    endcase
end

//Counter Flip- Flop
//emulates 1 second, in simulation it runs shorter than a second to allow simulation
//to complete faster
always_ff @(posedge clk_1sec, negedge reset_n) begin

    if(!reset_n) begin
	s_counter <= s_counter;
	m_counter <= 0;

	if(!mil_time) h_counter <= 12; //if standard time initialize to noon
	else h_counter <= 0; //if military time initialize to 00:00

    end

    else begin
	col <= ~col; //every second swap the value of col
	s_counter <= s_counter + 1; //every "second" increment counter
	if(s_counter == 59) begin //after 59 seconds, increment a minute counter
	    m_counter <= m_counter + 1;
	    s_counter <= 0; 

	    if(m_counter == 59) begin //at 59 minutes and 59 seconds, increment an hours counter
		temp <= temp;
		h_counter <= h_counter + 1;
		m_counter <= 0;
	        

		if(mil_time) begin //if military time

		    if(pm) begin h_counter <= h_counter + 13; //when pm, set time to itself plus 12 to compensate for pm
		    pm <= 0;
		    end

		    else temp <= temp; //otherwise do nothing


		    if(h_counter == 23) begin //once at 23:59:59 go back to 00:00:00
			s_counter <= 0;
			m_counter <= 0;
			h_counter <= 0;
		    end
		    
		    else temp <= temp; //otherwise do nothing

	        end

		if(!mil_time) begin //if standard time

		    if(h_counter > 11) begin //if either 12:59:59 or any military time greater up to 23:59:59
			if(h_counter == 12) pm <= ~pm; //swap pm if counter is 12 

			if(h_counter > 12) pm <= 1; //set pm to 1 because it is pm in military time

			else temp <= temp; //otherwise do nothing

			//reset counters
			s_counter <= 0; 
			m_counter <= 0;
			h_counter <= h_counter - 11;
		    end
		    
		    //in all cases, do nothing otherwise
		    else temp <= temp; 

		end

		else temp <= temp;

	    end

	    else temp <= temp;
		
	end

	else temp <= temp;

    end

end

endmodule


