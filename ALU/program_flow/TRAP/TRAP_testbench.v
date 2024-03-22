module TRAP_testbench;

// Inputs
reg first; // First instruction signal
// Outputs
wire trap_mode;

TRAP uut (
    .first(first),
    .trap_mode(trap_mode)
);

initial begin
    $dumpfile("TRAP_testbench.vcd");
    $dumpvars(0, TRAP_testbench);

    // Initialize the "first" signal
    first = 0;
    #10; 
    first = 1; // simulates rising edge
    #100;
    $finish; 
end

always @(posedge first) begin
    $display("Time %0t: Trap mode flag = %b", $time, trap_mode);
end

endmodule

