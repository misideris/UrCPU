/*
 CS 274
 Ursinus College

 @author: Mia Sideris
 @purpose: Demonstrate the implementation of Control Unit within a 20-bit Microprocessor

 */

module ControlUnit(
    input [3:0] opCode,
    input [1:0] Instr_Stage,
    
    // Trigged Stages
    output reg Instr_Fetch,
    output reg Instr_Decode,
    output reg Instr_Exec,
    output reg Write_Back,
    output reg MEM_Acc,
    output reg Halt

);

// Initialize Stages 

parameter Fetch = 2'b00;
parameter Decode = 2'b01;
parameter Execute = 2'b10;
parameter MEM = 2'b11;

// Initialize OpCode for each stage at various values

parameter Fetch_Code = 4'b0000;
parameter Load_Code = 4'b0000;
parameter Store_Code = 4'b0000;
parameter Halt_Code = 4'b1111;
parameter Jump_Code = 4'b0100;
parameter ALU_Code = 4'b0110;

always @* begin
    case(opCode)
        Fetch_Code:
        begin
            Instr_Fetch = (Instr_Stage == Fetch);
                Instr_Decode =1'b0;
                Instr_Exec =1'b0;
                MEM_Acc =1'b0;
                Write_Back =1'b0;
                Halt =1'b0;
        end
        Load_Code, Store_Code, ALU_Code, Jump_Code:
        begin
            Instr_Fetch =1'b0;
            Instr_Decode = (Instr_Stage == Decode);
            Instr_Exec = (Instr_Stage == Execute);
            MEM_Acc =(Instr_Stage == MEM);
            Write_Back=(Instr_Stage == MEM);
            Halt = 1'b0;
        end
        Halt_Code:
        begin
            Instr_Fetch =1'b0;
            Instr_Decode =1'b0;
            Instr_Exec =1'b0;
            MEM_Acc =1'b0;
            Write_Back =1'b0;
            Halt = 1'b1;
        end
        default: // Incorrect Opcode, halt 
        begin
            Instr_Fetch =1'b0;
            Instr_Decode =1'b0;
            Instr_Exec =1'b0;
            MEM_Acc =1'b0;
            Write_Back =1'b0;
            Halt = 1'b1;
        end
    endcase
end

endmodule
    