`timescale 1ns / 1ps

module LDD_testbench;

//input
reg [19:0] origin_address;
//output
wire [19:0] destination_register;

LDD uut (
    .Ro(origin_address),
    .Rd(destination_register)
);

initial begin
    $dumpfile("LDD_testbench.vcd");
    $dumpvars(0, LDD_testbench);

    origin_address = 20'h00000; // random examp address

    #10;

    $display("Time %0t: Initial origin address = %h", $time, origin_address);
    $display("Time %0t: Initial destination register = %h", $time, destination_register);

    #100;
    $finish;
end

endmodule

