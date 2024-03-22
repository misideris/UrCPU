`timescale 1ns / 1ps

module DEC_testbench;

//input
reg [19:0] data_input; 
// output
wire [19:0] decremented_output;

DEC uut (
    .data_input(data_input),
    .decremented_output(decremented_output)
);

initial begin
    $dumpfile("DEC_testbench.vcd");
    $dumpvars(0, DEC_testbench);
    data_input = 20'h10000; // rand input
    #10;
    $display("Time %0t: Initial data input = %h", $time, data_input);
    #100;
    $display("Time %0t: Decrement output = %h", $time, decremented_output);
    $finish;
end

endmodule
