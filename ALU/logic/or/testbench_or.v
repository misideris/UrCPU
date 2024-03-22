`include "or.v"
`default_nettype none

module testbench_or;
    reg [19:0] a;
    reg [19:0] b;
    wire [19:0] o;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    or_word or_inst (
        .a (a),
        .b (b),
        .o (o)
    );

    initial begin
        a <= 0;
        b <= 0;

        $dumpfile("testbench_or.vcd");
        $dumpvars(1, or_inst);
        $monitor ("a: 0b%0b - b: 0b%0b - o: 0b%0b", a, b, o);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
                b <= $urandom(SEED);
        end
    end

endmodule