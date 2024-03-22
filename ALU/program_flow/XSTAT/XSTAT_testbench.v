`timescale 1ns / 1ps

module XSTAT_testbench;


// Inputs
reg [19:0] status_register;
reg trap_mode;
reg [19:0] current_register;
// Outputs
wire [19:0] result; // Result output

XSTAT uut (
    .status_register(status_register),
    .trap_mode(trap_mode),
    .current_register(current_register),
    .result(result)
);

initial begin
    $dumpfile("XSTAT_testbench.vcd");
    $dumpvars(0, XSTAT_testbench);
    status_register = 20'h00000;
    trap_mode = 1'b0;
    current_register = 20'hABCDE;
    #10;
    $display("Time %0t: Initial status register = %h", $time, status_register);
    $display("Time %0t: Initial trap mode = %b", $time, trap_mode);
    $display("Time %0t: Initial current register = %h", $time, current_register);
    #100;
    trap_mode = 1'b1; // setting trap mode flag
    #100;
    $display("Time %0t: Result after XSTAT operation = %h", $time, result);
    $finish;
end

endmodule
