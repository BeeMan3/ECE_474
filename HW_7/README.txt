John Behman
ECE 474 HW #7

This assignment was to make a digital clock that tells time in both military and standard time formats. 
The assignment can be ran and simulated using the shell script provided (doit.sh). Using the command 
"bash doit.sh" will run the shell script and simulate the design with a do file created to cover all 
edge cases that could cause possible malfunction of the clock system. The seconds clock has been reduced 
in time to allow for a simulation that takes less overall time to process. The seconds clock runs at a
clock cycle of 10ms and the ms clock runs at 2ms. (1ms was not allowing me to visually see the ms clock)

When running the shell script, these are the expected results:
1) If a work directory doesn't exist, one is created

2) If the standard cell library isn't compiled, the script will compile it

3) The SystemVerilog file clock.sv is compiled using the vlog command

4) ModelSim is initaited to simulate the sv file using do file clock.do. After simulating, you will
be able to view the operation of the clock and the outputs produced. To verify operation, here is 
the relative location of all edge cases within the simulation:

note: the digit_select output correlates to the current segment being displayed on each index of the seven
segment display. ZERO being index zero and 4 being index 4. 2 indicates the colon. The segment_data is what is 
sent to that index of the seven segment display. Assuming an active high display, the expected outputs are:
   Binary   | Hex
0: 1111110  | 7E
1: 0110000  | 3O
2: 1101101  | 6D
3: 1111001  | 79
4: 0110011  | 33
5: 1011011  | 5B
6: 1011111  | 5F
7: 1110000  | 70
8: 1111111  | 7F
9: 1110011  | 73
colon: 1111111 (7F) or 0000000 (00)

	a. 1,000ns     - clock starts at time 00:00 in military time
	b. 1,600ns     - clock displays 00:01 after one "minute" has passed (60 of the reduced seconds clock cycles)
		i. for this location, the output of the colon, index 2, can be verified. At 59 seconds, the colon outputs 
		0000000 indicating it is off and at 1 minute it outputs 1111111 indicating it is on
	c. 7,000ns     - clock displays 00:09 and then displays 00:10
	d. 37,000ns    - clock displays 00:59 and then displays 01:00
	e. 361,000ns   - clock displays 9:59 and then displays 10:00
	f. 865,000ns   - clock displays 23:59 then loops back to 00:00
	g. 901,000ns   - the clock then moves to standard time and displays 1:00am and mil_time is 0
	h. 1,297,000ns - clock displays 11:59, then 12:00, and then 12:01
        i. 1,303,000ns - clock displays 12:09 and then displays 12:10	
	j. 1,333,000ns - the clock displays 12:59 and then loops to 1:00
	k. 1,765,000ns - for a 2nd time, the clock displays 12:59 and then loops to 1:00
	l. 2,377,000ns - military time is enabled and the time goes from 5:00pm to 18:00
        m. 3,277,000ns - military time is disabled and the time goes from 18:00 to 7:00pm
	n. 3,709,000ns - military time is reenabled and the time goes from 6:00am to 7:00 and continues to 23:59 and back to 00:00

Additionally, other locations can be checked for overall functionality, but the provided cases should provide all possible edge cases that 
would lead to common malfunction. After verifying correct operation, ModelSim can be closed and you will then want to proceed back to 
the terminal.

5) Design Vision will start up and run the commands designated in the file syn_clock
**note**: The compilation after using command read_sverilog clock.sv does not work on the first run of the shell script. It throws errors
on compilation. Please run the shell script again if you would like to see the compilation of the clock.sv in Design Vision

	a. clock.sv will be read, compiled, and the area and timing will be reported
	

6) After this, the .synopsys file will be downloaded if it doesn't exist and the shell script will be finished.


