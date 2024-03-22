`timescale 1ns / 1ps

module JMP_testbench;

// Inputs
reg [19:0] pc;
reg [19:0] jmp_address; 
// Outputs
wire [19:0] new_pc;

JMP uut (
    .pc(pc),
    .jmp_address(jmp_address),
    .new_pc(new_pc)
);

initial begin

    $dumpfile("JMP_testbench.vcd");
    $dumpvars(0, JMP_testbench);
    pc = 20'h00000; // Initial program counter
    jmp_address = 20'hABCDE; // example address (GPR)
    #10;
    $display("Time %0t: Initial program counter = %h", $time, pc);
    
    // do JMP Operation
    #100;
    jmp_address = 20'hFEDCB; // trigger by changing address
    
    $display("Time %0t: New program counter after JMP operation = %h", $time, new_pc);
    $finish;
end

endmodule
