`include "adder.v"
`default_nettype none

module adder_tb;
    reg [19:0] a;
    reg [19:0] b;
    wire [19:0] o;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    adder dut (
        .a (a),
        .b (b),
        .o (o)
    );

    initial begin
        a <= 0;
        b <= 0;

        $dumpfile("adder_tb.vcd");
        $dumpvars(1, dut);
        $monitor ("a: 0b%0b - b: 0b%0b - o: 0b%0b", a, b, o);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
                b <= $urandom(SEED);
        end
    end

endmodule