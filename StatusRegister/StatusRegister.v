/*
 CS 274
 Ursinus College

 @author: Mia Sideris
 @purpose: Demonstrate the implementation of a Status Register
 */

module StatusRegister(
    input clk,
    input reset,
    input [19:0] ALU_Output,
    input trap,
    input reg_to_instruction,
    input xorData,
    input [19:0] ALU_input_1,
    input [19:0] ALU_input_2,
    input Sign_Mode,
    output reg [19:0] statusReg,
    output reg [19:0] outputReg

);

parameter Zero_Flag = 9;
parameter Sign_Flag = 10;
parameter Overflow_Flag = 11;
parameter Underflow_Flag = 12;
parameter Carry_Flag = 13;
parameter Divide_By_Zero = 14;
parameter Half_Word = 15;
parameter Same_Reg = 16;
parameter MEM_Violate = 17;
parameter MEM_Corrupt = 18;
parameter Trap_Mode = 19;


always @(posedge clk or posedge reset) begin
    if (reset) begin
        statusReg <= 20'b0;
    end else begin
        statusReg[Zero_Flag] <= (ALU_Output == 0);
        statusReg[Sign_Flag] <= (ALU_Output[19]);
    
        //Overflow Flag
        if(Sign_Mode) begin
            statusReg[Overflow_Flag] <= (ALU_input_1[19]&ALU_input_2[19]&~ALU_Output[19])|(~ALU_input_1[19]&~ALU_input_2[19]&ALU_Output[19]);
        end else begin
            statusReg[Overflow_Flag] <= (ALU_input_1[19]==ALU_input_2[19]) & (ALU_Output[19]!=ALU_input_1[19]);
        end

        //Underflow Flag
        if(Sign_Mode) begin
            statusReg[Underflow_Flag] <= 0;
        end else begin
            statusReg[Underflow_Flag] <= (ALU_input_1[19]!=ALU_input_2[19]) & (ALU_Output[19]!=ALU_input_1[19]);
        end

        //Carry Flag
        statusReg[Carry_Flag] <= (Sign_Mode) ? (ALU_Output[20]):0;

        //Division By Zero
        statusReg[Divide_By_Zero] <= (ALU_Output == 20'h8000)?1:0;

        //Half-Word Mode
        statusReg[Half_Word] <= (Sign_Mode ==1)?1:0;


        //Same Register Flag
        statusReg[Same_Reg] <= ((ALU_Output == ALU_input_1)|(ALU_Output==ALU_input_2))?1:0;

        //MEM Violation Flag
        statusReg[MEM_Violate]<=((ALU_Output> 4095)||(ALU_Output<0))?1:0;

        //MEM Corruption Flag
        statusReg[MEM_Corrupt]<=$random?1:0;

        //Trap Mode Flag
        if(trap) begin
            statusReg[Trap_Mode]<=1;
            if(reg_to_instruction) begin
                outputReg<=statusReg;
            end
            if(xorData && statusReg[Trap_Mode]==1)begin
                statusReg<=statusReg^ALU_Output;
            end
        end else begin
            if(reg_to_instruction||xorData) begin
                outputReg <= 20'b0;
            end
            statusReg[Trap_Mode]<=0;
        end
    end
end

endmodule