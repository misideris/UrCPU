/*
 CS 274
 Ursinus College

 @author: Mia Sideris
 @purpose: Demonstrate the implementation of a 20-bit shift-left
 */

 `timescale 1ns/1ns

module shift_left_tb;

    reg clk;
    reg [19:0] a;
    reg [3:0] b;
    wire [19:0] c;

    shift_right right(.a(a), .b(b), .c(c), .clk(clk));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin 
        
        $dumpfile("shift_right_tb.vcd");
        $dumpvars(1, right);
        $monitor(a, b, c);

        a = 20'hA;
        b = 1;
        #100;

        $finish;
    end
endmodule
