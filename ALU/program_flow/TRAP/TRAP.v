module TRAP(  //Found this module, need more clarification though
    input first, // First instruction signal
    output reg trap_mode // Trap mode flag
);

initial begin
    trap_mode = 0; // not on 
end

always @(posedge first) begin
    trap_mode <= 1; // trap mode now equals one
end

endmodule
