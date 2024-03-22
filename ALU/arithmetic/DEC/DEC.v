module DEC (
    input wire [19:0] data_input,   // Input data to be decremented
    output reg [19:0] decremented_output // Output data after decrement
);

// DEC operation
always @(*) begin
    decremented_output = data_input - 1; // Decrement the input data by 1
end

endmodule
