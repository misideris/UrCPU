`timescale 1ns / 1ps

module MRR_testbench;

// Input
reg [19:0] Ro;
//ouput
wire [19:0] Rd;

MRR uut (
    .Ro(Ro),
    .Rd(Rd)
);

initial begin
    $dumpfile("MRR_testbench.vcd");
    $dumpvars(0, MRR_testbench);
    Ro = 20'hAAAAA; 
    #10;
    $display("Time %0t: Initial Ro value = %h", $time, Ro);
    $display("Time %0t: Initial Rd value = %h", $time, Rd);
    #100;
    $finish;
end

endmodule
