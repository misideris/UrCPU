`timescale 1 ns / 100 ps
`define TESTVECS 8

module testbench;
	reg clk, reset, load;
	reg [9:0]j;
	reg [19:0] i;
	wire [19:0] o;
	reg [6:0] test_vecs [0:(`TESTVECS-1)];
	
	integer index;
	initial begin $dumpfile("tb_file.vcd"); $dumpvars(0,testbench); end
	initial begin reset = 1'b1; #12.5 reset = 1'b0; end
	initial clk = 1'b0; always #5 clk =~ clk;
	initial begin
		test_vecs[0][6]=1'b0;	test_vecs[0][5:4]=2'b00;	test_vecs[0][3:0]=4'h5;
		test_vecs[1][6]=1'b1;	test_vecs[1][5:4]=2'b01;	test_vecs[1][3:0]=4'h6;
		test_vecs[2][6]=1'b0;	test_vecs[2][5:4]=2'b10;	test_vecs[2][3:0]=4'h7;
		test_vecs[3][6]=1'b1;	test_vecs[3][5:4]=2'b11;	test_vecs[3][3:0]=4'h8;
		test_vecs[4][6]=1'b1;	test_vecs[4][5:4]=2'b00;	test_vecs[4][3:0]=4'h9;
		test_vecs[5][6]=1'b1;	test_vecs[5][5:4]=2'b01;	test_vecs[5][3:0]=4'ha;
		test_vecs[6][6]=1'b1;	test_vecs[6][5:4]=2'b10;	test_vecs[6][3:0]=4'hb;
		test_vecs[7][6]=1'b1;	test_vecs[7][5:4]=2'b11;	test_vecs[7][3:0]=4'hc;
	end
	
  initial {load, j, i} = 0;
  general_purpose_register1 reg_0(clk,reset,load,i,j,o);
  initial begin
   #6 for(index=0;index<`TESTVECS;index=index+1)
		begin #10{load, j, i}=test_vecs[index]; end
	#100 $finish;
  end
endmodule