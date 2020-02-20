
# chmod

if [ ! -d work ] 
    echo work does not exist, making it
    vlib work
fi

cd work #check this
if [ ! -s _lib.qdb ] 
vlog /nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/Digital_Standard_Cell_Library/verilog/*.v
echo compiling gate library to the work directory
fi
cd .//

if [ -s mult.sv] 
    vlog mult.sv
else
    echo mult.sv doesnt exist
fi

if [ -s mult_state.sv ] 
    vlog mult_state.sv
else
    echo mult_state.sv doesnt exist
fi

if [ -s operations.sv ] 
    vlog operations.sv
else
    echo operations.sv doesnt exist
fi

if [ -s mult.do ] 
    vsim -novopt mult -do mult.do -quiet -c -t 1ns +nowarnTFMPC +nowarnTSCALE
    mv mult.list mult.RTL.list
    quit!
else
    echo mult.do doesnt exist
fi

if [ -s syn_mult ] 
    design_vision-xg -f syn_mult
else
    echo syn_mult file doesnt exist
fi

if [ ! -s .synopsys_dc.setup ] 
    wget http://web.engr.oregonstate.edu/~traylor/ece474/.synopsys_dc.setup
fi

if [ -s mult.gate.v ] 
    vlog -novopt mult.gate.v
else
    echo mult.gate.v doesnt exist
fi

if [ -s mult.do ] 
    vsim -novopt mult -do mult.do -quiet -c 1ns +nowarnTFMPC +nowarnTSCALE
    mv mult.list mult.GATE.list
    quit!
else
    echo mult.do doesnt exist
fi

diff mult.RTL.list mult.GATE.list >| diff_report

if [ ! -s diff_report ] 
    echo The files have no differences
else
    echo The files have differences
fi











