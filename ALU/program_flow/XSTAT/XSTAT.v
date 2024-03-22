module XSTAT(
    input wire [19:0] status_register, // Status register input
    input wire trap_mode, // trap mode flag
    input wire [19:0] current_register, // Current register input (to be combined with status register)
    output reg [19:0] result 
);


always @(*) begin
    if (trap_mode) begin
        result = status_register ^ current_register; // if trap mode is set, XOR operation
    end else begin
        result = status_register; // else, leave result the same
    end
end

endmodule
