module full_subtractor (
    input [19:0] A,
    input [19:0] B,
    input Bin,
    output reg [19:0] Diff,
    output reg Bout
);

always @* begin : subtractor_logic // ": subtractor logic" fixes "Variable declaration in unnamed block requires SystemVerilog" error.
    integer i;
    reg borrow;

    Diff = A ^ B ^ Bin; // Diff = A xor B xor Bin
    Bout = (~A[0] & B[0]) | (Bin & (A[0] ^ B[0])); // borrow the item most over to the left

    borrow = Bin; // Borrows extra input
    for (i = 0; i < 20; i = i + 1) begin
        if ((B[i] | borrow) & (~A[i] | borrow)) begin //determines if a borrow needs to happen, if so, then we borrow
            Diff[i] = 1;
            borrow = Bout; // Sets borrow for next iteration based on the current Bout
        end else if ((~B[i] & A[i]) | borrow) begin
            Diff[i] = 0;
            borrow = Bout; // Borrows for next iteration
        end
    end
end

endmodule