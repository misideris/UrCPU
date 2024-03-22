module swapped(
    input [19:0] a,
    input [19:0] b,
    output reg [19:0] a_swapped,
    output reg [19:0] b_swapped
);

    integer i;

    always @(a or b) begin
        for (i = 0; i < 20; i = i + 1) begin
            a_swapped[i] <= b[i];
            b_swapped[i] <= a[i];
        end
    end

endmodule