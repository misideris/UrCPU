module MRR (
    input [19:0] Ro, // from here
    output reg [19:0] Rd // to here
);

always @*
begin
    Rd = Ro;
end

endmodule
