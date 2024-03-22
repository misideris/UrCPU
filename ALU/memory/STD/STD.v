module STD (
    input wire [19:0] Ro, // Data to be stored
    output reg [19:0] stored_data // Stored data
);

// Assign the stored data to the output using combinational logic
always @*
    stored_data = Ro;

endmodule
