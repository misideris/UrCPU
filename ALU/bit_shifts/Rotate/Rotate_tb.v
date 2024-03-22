/*
 CS 274
 Ursinus College

 @author: Mia Sideris
 @purpose: Demonstrate the implementation of Rotate Left, Rotate Right

 */

`timescale 1ns/1ns

module Rotate_tb;
    reg [19:0] Data_L;
    reg [19:0] Data_R;
    wire [19:0] R_Left;
    wire [19:0] R_Right;

    Rotate rotate(
        .Data_L(Data_L),
        .R_Left(R_Left),
        .Data_R(Data_R),
        .R_Right(R_Right)
    );

    initial begin
        $dumpfile("Rotate_tb.vcd");
        $dumpvars(0, Rotate_tb);
        Data_L = 20'b10101010101010101010;

        Data_R = 20'b10101010101010101010;

        #10;
    
        $display("Data_L: %b, R_Left: %b", Data_L, R_Left);
        $display("Data_R: %b, R_Right: %b", Data_R, R_Right);
    
        $finish;
    end

endmodule


