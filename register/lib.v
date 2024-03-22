// Invert: Takes 1 input, performs NOT and assigns to output
module invert (input wire i, output wire o);
    assign o = !i;
endmodule

// And: Takes 2 inputs, performs AND and assigns result to output
module and2 (input wire i0, i1, output wire o);
  assign o = i0 & i1;
endmodule

// 2x1 multiplexor: Takes 2 inputs, assigns either first or second input to the output depending on j
module mux2x1 (input wire i0, i1, j, output wire o);
  assign o = (j==0)?i0:i1;
endmodule

// D Flip-Flop: Takes 1 input as well as clock, assigns input to output at each rising edge of clock
module d_flip_flop (input wire clk, in, output wire out);
  reg df_out;
  always@(posedge clk) df_out <= in;
  assign out = df_out;
endmodule

// D Flip-Flop with reset: Takes 1 input as well as clock and reset, when reset is active output is set to 0,
// otherwise 
module d_flip_flop_reset (input wire clk, reset, in, output wire out);
  wire reset_, df_in;
  invert invert_0 (reset, reset_);
  and2 and2_0 (in, reset_, df_in);
  d_flip_flop df_0 (clk, df_in, out);
endmodule

// D Flip-flop with reset and load: when load is active, the input is loaded into the flip-flop,
// otherwise it works the same as the D flip-flop with reset above.
module d_flip_flop_reset_and_load (input wire clk, reset, load, in, output wire out);
  wire _in;
  mux2x1 mux2_0(out, in, load, _in);
  d_flip_flop_reset dfr_1(clk, reset, _in, out);
endmodule