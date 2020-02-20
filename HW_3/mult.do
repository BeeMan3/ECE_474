add wave sim:/mult/*
		  
force -freeze sim:/mult/start 1'h1 100
force -freeze sim:/mult/clk 1 0, 0 {50 ns} -r 100
force reset 1
force a_in 16#C372
force b_in 16#A232
run 7500

force reset 0 
force a_in 16#B4
force b_in 16#7C
run 400

force reset 1
run 7500

force reset 0 
force a_in 16#FFFFFFFF
force b_in 16#FFFFFFFF
run 400

force reset 1
run 7500

force reset 0 
force a_in 16#CF3
force b_in 16#14A
run 2000

force reset 1
force start 0
run 7500


