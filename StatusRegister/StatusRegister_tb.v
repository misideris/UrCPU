/*
 CS 274
 Ursinus College

 @author: Mia Sideris
 @purpose: Demonstrate the implementation of a Status Register
 */

`timescale 1ns/1ns

module StatusRegister_tb;

parameter CLK_Period = 10;

reg clk=0;
reg reset =1;
reg trap = 0;
reg reg_to_instruction=0;
reg xorData=0;
reg Sign_Mode=0;
reg [19:0] ALU_input_1;
reg [19:0] ALU_input_2;
reg [19:0] ALU_Output;

wire [19:0] statusReg;
wire [19:0] outputReg;

StatusRegister dut(
.clk(clk),
.reset(reset),
.trap(trap),
.reg_to_instruction(reg_to_instruction),
.xorData(xorData),
.Sign_Mode(Sign_Mode),
.ALU_Output(ALU_Output),
.ALU_input_1(ALU_input_1),
.ALU_input_2(ALU_input_2),
.statusReg(statusReg),
.outputReg(outputReg)

);

always #CLK_Period clk = ~clk;

//Testing operation with varying positive values of ALU inputs

initial begin
    $dumpfile("StatusRegister_tb.vcd");
    $dumpvars(0, StatusRegister_tb);

    reset = 1;
    #100;
    reset = 0;

    ALU_input_1 = 10;
    ALU_input_2 = 5;
    Sign_Mode = 1;
    ALU_Output = ALU_input_1 + ALU_input_2;
    #100;
    $stop;

end

endmodule

