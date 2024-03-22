module LSTAT (
    input wire [7:0] status_register, // Status register (8 bits) // Should be smaller than 20 bits I think
    output reg [19:0] data_out // data output (20 bits)
);

always @(*) begin
    data_out = {8'b0, status_register}; // Load status register into the data output
end

//the data out line has 8'b0 because it is aligned with 20 bits now by adding leading zeros to it.

endmodule
