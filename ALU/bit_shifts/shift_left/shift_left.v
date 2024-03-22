/*
 CS 274
 Ursinus College

 @author: Mia Sideris
 @purpose: Demonstrate the implementation of a 20-bit shift-left
 */

module shift_left (

    input clk,              // Each shift occurs synchronous to clock cycle
    input [19:0] a,         // Input bits to apply shift to
    input [3:0] b,          // Number of shifts, set to 4
    output reg [19:0] c     // Bits after left-shift
);

always @(posedge clk) begin
    c <= a << b;
end

endmodule
