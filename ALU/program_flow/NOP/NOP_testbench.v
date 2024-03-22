`timescale 1ns / 1ps
module NOP_testbench;

// Inputs
reg [19:0] data;
reg reset; // Reset signal
// Outputs
wire [19:0] result;

NOP uut (
    .data(data),
    .result(result)
);

initial begin
    $dumpfile("NOP_testbench.vcd");
    $dumpvars(0, NOP_testbench);

    reset = 0;
    data = 20'h12345; // some input data

    // reset on
    #10;
    reset = 1;
    #10;
    reset = 0;
    #100;
    data = 20'hABCDE; // some more input data for change
    #100;
    $finish; //end sim
end

// deleted clock variables and just use display always while result exists
always @(result) begin
    $display("Time %0t: Result = %h", $time, result);
end

endmodule
