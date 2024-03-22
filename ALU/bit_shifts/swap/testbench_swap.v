`include "swap.v"
`default_nettype none

module testbench_swap;

    //inputs
    reg [19:0] a;
    reg [19:0] b;

    //outputs
    wire [19:0] a_swapped;
    wire [19:0] b_swapped;

    // instantiate the swapped module
    swapped x0(
        .a (a),
        .b (b),
        .a_swapped (a_swapped),
        .b_swapped (b_swapped)
    );

    initial begin
        // Open VCD file
        $dumpfile("testbench_swap.vcd");
        // Dump variables
        $dumpvars(0, x0); // Dump all variables associated with module x0
        $monitor ("a: %b, b: %b, a_swapped: %b, b_swapped: %b", a, b, a_swapped, b_swapped);

        // Initialize inputs
        a = 20'b10101010101010101010;
        b = 20'b01010101010101010101;
        $display("Original values: a=%b, b=%b", a, b);
        #10;
        $display("Swapped values: a_swapped=%b, b_swapped=%b", a_swapped, b_swapped);
        $finish;

    end

endmodule