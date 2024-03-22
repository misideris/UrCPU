module JMP (
    input wire [19:0] pc, //program counter, holds memory address of next instruction
    input wire [19:0] jmp_address, // address of pc from GPR
    output reg [19:0] new_pc // New program counter after JMP operation
);

always @(*) begin
    new_pc = jmp_address; // Updates program counter with the new JMP address
end

endmodule