module NOT (
    input wire [19:0] input_register,
    output reg [19:0] output_register
);

always @(*) begin
    output_register = ~input_register; // flips to be opposite
end

endmodule