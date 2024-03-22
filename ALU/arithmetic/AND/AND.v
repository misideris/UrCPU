/*
 CS 274
 Ursinus College

 @author: Mia Sideris
 @purpose: Demonstrate the implementation of a 20-bit AND circuit
 */
module AND(
    input [19:0] a,
    input [19:0] b,
    output reg [19:0] c    

);

    always @* begin
    c = a & b;
    end

endmodule