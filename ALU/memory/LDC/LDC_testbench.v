`timescale 1ns / 1ps

module LDC_testbench;

reg [19:0] constant_value;
wire [19:0] register_output;

LDC uut (
    .C(constant_value),
    .R(register_output)
);

initial begin
    
    $dumpfile("LDC_testbench.vcd");
    $dumpvars(0, LDC_testbench);

    constant_value = 20'h12345; // random constant
    #10;
    $display("Time %0t: Initial constant value = %h", $time, constant_value);
    #10
    $display("Time %0t: Register output = %h", $time, register_output);
    #100;
    $finish;
end

endmodule
