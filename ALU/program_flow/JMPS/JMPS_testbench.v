`timescale 1ns / 1ps

module JMPS_testbench;

// Inputs
reg [19:0] pc;
reg sign_flag; 
reg [19:0] jmp_address;
// Outputs
wire [19:0] new_pc;

JMPS uut (
    .pc(pc),
    .sign_flag(sign_flag),
    .jmp_address(jmp_address),
    .new_pc(new_pc)
);


initial begin
    $dumpfile("JMPS_testbench.vcd");
    $dumpvars(0, JMPS_testbench);
    // Initialize inputs
    pc = 20'h00000; // Initial program counter
    sign_flag = 0;// Set sign flag to 0 for testing JMPS
    jmp_address = 20'hABCDE; // Example address from GPR
    #10;
    // showing initial state
    $display("Time %0t: Initial program counter = %h", $time, pc);
    $display("Time %0t: Sign flag = %b", $time, sign_flag);
    // triggering JMP operation
    #100;
    sign_flag = 1;
    // new state after JMPS Operation
    $display("Time %0t: New program counter after JMPS operation = %h", $time, new_pc);
    $finish;
end

endmodule
