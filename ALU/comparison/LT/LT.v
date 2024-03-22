module LT (
    input wire [19:0] register_A, // Input register A
    input wire [19:0] register_B, // Input register B
    output reg sign_flag          // Sign flag output
);

// LT operation
always @(*) begin
    if (register_A < register_B) begin
        sign_flag = 1; // Set sign flag to 1 if register A is less than register B
    end
    else begin
        sign_flag = 0; // Set sign flag to 0 otherwise
    end
end

endmodule
