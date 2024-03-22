/*
 CS 274
 Ursinus College

 @author: Mia Sideris
 @purpose: Demonstrate the implementation of Read-Only Increment Registers: Instruction Count, Memory Access and Memory Correction
 */

`timescale 1ns/1ns

module IncrementRegister_tb;

    parameter CLK_Period = 10;

    reg clk;
    reg reset;
    reg Instruc_Count_Ex;
    reg MEM_Acc_Ex;
    reg MEM_Correct_Ex;

    wire [19:0] Instruc_Reg;
    wire [19:0] MEM_Acc_Reg;
    wire [19:0] MEM_Correct_Reg;

    IncrementRegister DUT(
        .clk(clk),
        .reset(reset),
        .Instruc_Count_Ex(Instruc_Count_Ex),
        .MEM_Acc_Ex(MEM_Acc_Ex),
        .MEM_Correct_Ex(MEM_Correct_Ex),
        .Instruc_Reg(Instruc_Reg),
        .MEM_Acc_Reg(MEM_Acc_Reg),
        .MEM_Correct_Reg(MEM_Correct_Reg)
    );

    always #((CLK_Period/2)) clk = ~clk;

    initial begin
        $dumpfile("IncrementRegister_tb.vcd");
        $dumpvars(0, IncrementRegister_tb);
        clk = 0;
        reset=1;
        Instruc_Count_Ex=1;
        MEM_Acc_Ex=1;
        MEM_Correct_Ex=0;

        #50;

        reset=0;
        #10
        Instruc_Count_Ex=1;
        #10
        Instruc_Count_Ex=1;
        #10
        MEM_Acc_Ex=1;
        #10
        MEM_Correct_Ex=1;
        #50;
        $finish;
    end
endmodule