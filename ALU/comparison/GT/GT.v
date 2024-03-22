module GT (
    input wire [19:0] register_A,
    input wire [19:0] register_B, 
    output reg sign_flag // 1 or 0 output
);

// GT operation
always @(*) begin
    if (register_A > register_B) begin
        sign_flag = 1; //if A > B set flag to 1
    end
    else begin
        sign_flag = 0; // sets flag to 0
    end
end

endmodule
