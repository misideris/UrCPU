/*
 CS 274
 Ursinus College

 @author: Mia Sideris
 @purpose: Demonstrate the implementation of Read-Only Increment Registers: Instruction Count, Memory Access and Memory Correction
 */

module IncrementRegister(
    input clk,
    input reset,
    input Instruc_Count_Ex,
    input MEM_Acc_Ex,
    input MEM_Correct_Ex,

    output reg [19:0] Instruc_Reg,
    output reg [19:0] MEM_Acc_Reg,
    output reg [19:0] MEM_Correct_Reg
);

always @ (posedge clk or posedge reset) begin
    if(reset)
    begin
        Instruc_Reg<= 20'b0;
        MEM_Acc_Reg<= 20'b0;
        MEM_Correct_Reg<=20'b0;
    end
end

always @ (posedge clk)begin
    if(reset)
    begin
        Instruc_Reg<= 20'b0;
        MEM_Acc_Reg<= 20'b0;
        MEM_Correct_Reg<=20'b0;
    end
    else
    begin
    if(Instruc_Count_Ex)
        Instruc_Reg = Instruc_Reg +1;
    if(MEM_Acc_Ex)
        MEM_Acc_Reg = MEM_Acc_Reg +1;
    if(MEM_Correct_Ex)
        MEM_Correct_Reg = MEM_Correct_Reg +1;
    end
end

endmodule