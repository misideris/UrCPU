`timescale 1ns / 1ps

module JMPZ_testbench;


// Inputs
reg [19:0] pc;
reg zero_flag;
reg [19:0] jmp_address;
// Outputs
wire [19:0] new_pc; // New program counter after JMPZ operation

JMPZ uut (
    .pc(pc),
    .zero_flag(zero_flag),
    .jmp_address(jmp_address),
    .new_pc(new_pc)
);


initial begin
    $dumpfile("JMPZ_testbench.vcd");
    $dumpvars(0, JMPZ_testbench);
    // Initialize inputs
    pc = 20'h00000;
    zero_flag = 1;
    jmp_address = 20'hABCDE; // example address
    
    // reset
    #10;
    // showing initial state
    $display("Time %0t: Initial program counter = %h", $time, pc);
    $display("Time %0t: Zero flag = %b", $time, zero_flag);
    // start JMPZ operation after some time
    #100; // wait then trigger jmpz
    zero_flag = 0; // Trigger the JMPZ operation
    $display("Time %0t: New program counter after JMPZ operation = %h", $time, new_pc); //display new pc
    
    // End simulation
    $finish;
end

endmodule
