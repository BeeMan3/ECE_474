
#chmod +w 700

if [ ! -d work ] 
then
    echo work does not exist, making it
    vlib work
fi

cd work #check this
if [ ! -s _lib.qdb ] 
then
cd ../    
vlog /nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/Digital_Standard_Cell_Library/verilog/*.v
echo compiling gate library to the work directory
else
    cd ../
fi


if [ -s clock.sv ]  
then    
    vlog clock.sv
else
    echo clock.sv doesnt exist
fi

if [ -s clock.do ]  
then    
    vsim -novopt clock -do clock.do
else
    echo clock.do doesnt exist
fi

if [ -s syn_clock ] 
then    
    design_vision-xg -f syn_clock
else
    echo syn_clock file doesnt exist
fi

if [ ! -s .synopsys_dc.setup ] 
then    
    wget http://web.engr.oregonstate.edu/~traylor/ece474/.synopsys_dc.setup
fi












