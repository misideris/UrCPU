/*
 CS 274
 Ursinus College

 @author: Mia Sideris
 @purpose: Demonstrate the implementation of a 20-bit AND circuit
 */
`timescale 1ns/1ns

module AND_tb;

reg [19:0] a;
reg [19:0] b;
wire [19:0] c;

AND and_gate(.a(a), .b(b), .c(c));

initial 
begin

    $dumpfile("AND_tb.vcd");
    $dumpvars(1, and_gate);
    $monitor(a, b, c);
    a = 1'b0;
    b = 1'b0;

    #5
    a = 1'b0;
    b = 1'b1;

    #5
    a = 1'b1;
    b = 1'b0;

    #5
    a = 1'b1;
    b = 1'b1;

end

endmodule