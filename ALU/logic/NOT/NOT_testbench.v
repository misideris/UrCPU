`timescale 1ns / 1ps

module NOT_testbench;

// Inputs
reg [19:0] input_register;
// Outputs
wire [19:0] output_register;

NOT uut (
    .input_register(input_register),
    .output_register(output_register)
);

initial begin
    $dumpfile("NOT_testbench.vcd");
    $dumpvars(0, NOT_testbench);
    input_register = 20'h152AA; // Example input value
    #10;
    $display("Time %0t: Initial input register value = %h", $time, input_register);
    #100;
    $display("Time %0t: Output register value after NOT operation = %h", $time, output_register);
    $finish;
end

endmodule
