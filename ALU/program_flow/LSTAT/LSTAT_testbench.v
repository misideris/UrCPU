`timescale 1ns / 1ps

module LSTAT_testbench;

// Inputs
reg [7:0] status_register; 
// Outputs
wire [19:0] data_out;

LSTAT uut (
    .status_register(status_register),
    .data_out(data_out)
);

initial begin
    
    $dumpfile("LSTAT_testbench.vcd");
    $dumpvars(0, LSTAT_testbench);
    status_register = 8'hFF; // Example status register value
    #10;
    
    // Displaying initial state
    $display("Time %0t: Initial status register value = %h", $time, status_register);
    #100;
    $finish;
end

endmodule
