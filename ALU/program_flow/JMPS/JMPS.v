module JMPS (
    input wire [19:0] pc,
    input wire sign_flag, // Sign flag (1 if negative, 0 otherwise)
    input wire [19:0] jmp_address, //Address receieved from GPR
    output reg [19:0] new_pc  //new program counter after JMPS operation
);

always @(*) begin
    if (sign_flag) begin
        // if the sign flag is set, perform the jump
        new_pc = jmp_address;
    end else begin
        // otherwise, continue with the current program counter
        new_pc = pc;
    end
end

endmodule
