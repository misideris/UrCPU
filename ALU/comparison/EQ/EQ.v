module EQ (
    input wire [19:0] register_A,
    input wire [19:0] register_B,
    output reg zero_flag
);

// EQ operation
always @(*) begin
    if (register_A == register_B) begin
        zero_flag = 1; // Set zero flag to 1 if register A is equal to register B
    end
    else begin
        zero_flag = 0; // Set zero flag to 0 otherwise
    end
end

endmodule