`include "xor.v"
`default_nettype none


module testbench_xor;
    // Set inputs and outputs
    reg [19:0] a;
    reg [19:0] b;
    wire [19:0] c;
    wire zero;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the XOR
    xor_word x0 (
        .a (a),
        .b (b),
        .c (c),
        .zero (zero)
    );

    initial begin
        a <= 0;
        b <= 0;

        $dumpfile("testbench_xor.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - b: 0b%0b - c: 0b%0b - zero: 0b%0b", a, b, c, zero);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
                b <= $urandom(SEED);
        end
    end

endmodule