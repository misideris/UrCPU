module JMPZ (
    input wire [19:0] pc, // Program counter (instructions)
    input wire zero_flag, // Zero flag (1 if zero, 0 otherwise)
    input wire [19:0] jmp_address,  // address receieved from GPR
    output reg [19:0] new_pc  // new Program counter (instructions)
);

always @(*) begin
    if (zero_flag) begin
        new_pc = jmp_address; // Perform the jump if zero flag is set
    end else begin
        new_pc = pc;// if zero flag != 1, continue with program
    end
end

endmodule
