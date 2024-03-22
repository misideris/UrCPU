# CS 274
# Ursinus College
#
# @author: Santiago Nunez-Corrales
# @purpose: Demonstrate the implementation of simple operations

TESTBENCH=testbench_xor

all:
	iverilog -o $(TESTBENCH).vvp $(TESTBENCH).v
	vvp $(TESTBENCH).vvp -vcd
	gtkwave $(TESTBENCH).vcd

clean:
	rm -f *.vcd *.vvp