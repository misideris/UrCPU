`include "subtract.v"
`default_nettype none

module testbench_subtractor;

// Inputs
reg [19:0] A;
reg [19:0] B;
reg Bin;

// Outputs
wire [19:0] Diff;
wire Bout;

full_subtractor uut ( // something under test
    .A(A),
    .B(B),
    .Bin(Bin),
    .Diff(Diff),
    .Bout(Bout)

);

///// I THINK THIS STUFF WORKS FOR 20 BIT. LOOK UP MORE STUFF THOUGH

initial begin
    $dumpfile("testbench_subtractor.vcd");
    $dumpvars(0, testbench_subtractor);
    $display("Start testbench for full subtractor");

    #10; 
    A = 20'b00000000000000001011; B = 20'b00000000000000000110; Bin = 1'b0; // 11 - 6 = 5
    $display("Test case: A = %b, B = %b, Bin = %b", A, B, Bin);
    #10;
    $display("Result: Diff = %b", Diff);
    
    #10; 
    A = 20'b00000000000000000110; B = 20'b00000000000000000110; Bin = 1'b1; // 6 - 6 = 0
    $display("Test case: A = %b, B = %b, Bin = %b", A, B, Bin);
    #10;
    $display("Result: Diff = %b", Diff);
    
    #10; 
    A = 20'b00000000000000001111; B = 20'b00000000000000001111; Bin = 1'b0; // 15 - 15 = 0
    $display("Test case: A = %b, B = %b, Bin = %b", A, B, Bin);
    #10;
    $display("Result: Diff = %b", Diff);
end


endmodule

