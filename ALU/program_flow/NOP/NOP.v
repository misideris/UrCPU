module NOP (
    input wire [19:0] data,
    output reg [19:0] result
);

always @(*) begin
    result = data; //result equals data because we do nothing
end

endmodule
