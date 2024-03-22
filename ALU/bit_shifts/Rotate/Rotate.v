/*
 CS 274
 Ursinus College

 @author: Mia Sideris
 @purpose: Demonstrate the implementation of Rotate Left, Rotate Right

 */
module Rotate(
    input [19:0] Data_L,
    output [19:0] R_Left,
    input [19:0] Data_R,
    output [19:0] R_Right
);

RL left(
    .Data_L(Data_L),
    .R_Left(R_Left)
);

RR right(
    .Data_R(Data_R),
    .R_Right(R_Right)
);

endmodule

module RL(
    input [19:0] Data_L,
    output [19:0] R_Left
);

    assign R_Left = {Data_L[18:0], Data_L[19]}; 
endmodule

module RR(
    input [19:0] Data_R,
    output [19:0] R_Right
);

    assign R_Right = {Data_R[0], Data_R[19:1]}; 

endmodule
