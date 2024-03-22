module LDC (
    input [19:0] C,     // Constant value to load
    output reg [19:0] R // Destination register
);

// Load constant operation
always @*
    R = C;

endmodule
