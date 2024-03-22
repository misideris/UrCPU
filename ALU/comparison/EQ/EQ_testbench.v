`timescale 1ns / 1ps

module EQ_testbench;

// Inputs
reg [19:0] register_A;
reg [19:0] register_B;
// Outputs
wire zero_flag;

EQ uut (
    .register_A(register_A),
    .register_B(register_B),
    .zero_flag(zero_flag)
);

initial begin
    $dumpfile("EQ_testbench.vcd");
    $dumpvars(0, EQ_testbench);
    // initializing inputs
    register_A = 20'hABCDE;
    register_B = 20'hABCDE;
    #10;
    $display("Time %0t: Initial value of register A = %h", $time, register_A);
    $display("Time %0t: Initial value of register B = %h", $time, register_B);
    #100;
    
    // zero flag after comparing
    $display("Time %0t: Zero flag after comparison = %b", $time, zero_flag);
    $finish;
end

endmodule
