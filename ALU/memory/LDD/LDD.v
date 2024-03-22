module LDD (
    input [19:0] Ro, // from here
    output reg [19:0] Rd // to here
);

reg [19:0] memory [0:63]; // does something?

always @*
begin
    Rd = memory[Ro];
end

endmodule
