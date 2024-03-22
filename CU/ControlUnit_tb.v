/*
 CS 274
 Ursinus College

 @author: Mia Sideris
 @purpose: Demonstrate the implementation of Control Unit within a 20-bit Microprocessor

 */

`timescale 1ns/1ns
//`include "ControlUnit.v"

module ControlUnit_tb;

    parameter CLK_Period = 10;

    reg [1:0] Instr_Stage;
    reg [3:0] opCode;
    
    wire Instr_Fetch;
    wire Instr_Decode;
    wire Instr_Exec;
    wire Write_Back;
    wire MEM_Acc;
    wire Halt;

    ControlUnit dut(
        .opCode(opCode),
        .Instr_Stage(Instr_Stage),
        .Instr_Fetch(Instr_Fetch),
        .Instr_Decode(Instr_Decode),
        .Instr_Exec(Instr_Exec),
        .Write_Back(Write_Back),
        .MEM_Acc(MEM_Acc),
        .Halt(Halt)
    );

    reg clk =0;
    always #((CLK_Period)/2)clk=~clk;

    initial begin
        $dumpfile("ControlUnit_tb.vcd");
        $dumpvars(0, ControlUnit_tb);
        opCode = 4'b0000;
        Instr_Stage=2'b00;
        #50;

        // Testing Instruction Fetch
        opCode = 4'b0000;
        Instr_Stage =2'b00;
        #10;
        $display("Instruction Fetch: %b", Instr_Fetch);

        // Testing Instruction Decode
        opCode = 4'b0000;
        Instr_Stage =2'b01;
        #10;
        $display("Instruction Decode: %b", Instr_Decode);  

        // Testing Instruction Execute
        opCode = 4'b0000;
        Instr_Stage =2'b10;
        #10;
        $display("Instruction Execute: %b", Instr_Exec);

        // Testing Memory Acecess
        opCode = 4'b0000;
        Instr_Stage =2'b11;
        #10;
        $display("Memory Access: %b", MEM_Acc);

        $finish;
    end
endmodule

