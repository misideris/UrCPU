`timescale 1ns / 1ps

module STD_testbench;

// Inputs
reg [19:0] Ro;
// Outputs
wire [19:0] stored_data;

STD uut (
    .Ro(Ro),
    .stored_data(stored_data)
);

initial begin
    $dumpfile("STD_testbench.vcd");
    $dumpvars(0, STD_testbench);

    Ro = 20'h12345; // //example data to be stored
    #10;
    $display("Time %0t: Initial data to be stored = %h", $time, Ro);
    $display("Time %0t: Initial stored data = %h", $time, stored_data); //prints stored data. is same as Ro
    #100;
    $finish;
end

endmodule
