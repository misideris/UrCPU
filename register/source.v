// 4x1 multiplexor
module mux4x1(input wire i0,i1,i2,i3, input wire s1, s0, output wire o);
wire t0, t1;
mux2x1 mux2_0 (i0, i1, s1, t0);
mux2x1 mux2_1 (i2, i3, s1, t1);
mux2x1 mux2_2 (t0, t1, s0, o);
endmodule

// D Flip-Flop
module dff(input wire clk, reset, load, input wire [19:0] in, output wire [19:0] reg_in);
d_flip_flop_reset_and_load _f0(clk, reset, load, in[0], reg_in[0]);
d_flip_flop_reset_and_load _f1(clk, reset, load, in[1], reg_in[1]);
d_flip_flop_reset_and_load _f2(clk, reset, load, in[2], reg_in[2]);
d_flip_flop_reset_and_load _f3(clk, reset, load, in[3], reg_in[3]);
d_flip_flop_reset_and_load _f4(clk, reset, load, in[4], reg_in[4]);
d_flip_flop_reset_and_load _f5(clk, reset, load, in[5], reg_in[5]);
d_flip_flop_reset_and_load _f6(clk, reset, load, in[6], reg_in[6]);
d_flip_flop_reset_and_load _f7(clk, reset, load, in[7], reg_in[7]);
d_flip_flop_reset_and_load _f8(clk, reset, load, in[8], reg_in[8]);
d_flip_flop_reset_and_load _f9(clk, reset, load, in[9], reg_in[9]);
d_flip_flop_reset_and_load _f10(clk, reset, load, in[10], reg_in[10]);
d_flip_flop_reset_and_load _f11(clk, reset, load, in[11], reg_in[11]);
d_flip_flop_reset_and_load _f12(clk, reset, load, in[12], reg_in[12]);
d_flip_flop_reset_and_load _f13(clk, reset, load, in[13], reg_in[13]);
d_flip_flop_reset_and_load _f14(clk, reset, load, in[14], reg_in[14]);
d_flip_flop_reset_and_load _f15(clk, reset, load, in[15], reg_in[15]);
d_flip_flop_reset_and_load _f16(clk, reset, load, in[16], reg_in[16]);
d_flip_flop_reset_and_load _f17(clk, reset, load, in[17], reg_in[17]);
d_flip_flop_reset_and_load _f18(clk, reset, load, in[18], reg_in[18]);
d_flip_flop_reset_and_load _f19(clk, reset, load, in[19], reg_in[19]);
endmodule

// Multiplexor
module mux(input wire [19:0] reg_in, input wire j1, j0, output wire [19:0] o);
wire [19:0] _inv;
invert _i0(reg_in[0], _inv[0]);
invert _i1(reg_in[1], _inv[1]);
invert _i2(reg_in[2], _inv[2]);
invert _i3(reg_in[3], _inv[3]);
invert _i4(reg_in[4], _inv[4]);
invert _i5(reg_in[5], _inv[5]);
invert _i6(reg_in[6], _inv[6]);
invert _i7(reg_in[7], _inv[7]);
invert _i8(reg_in[8], _inv[8]);
invert _i9(reg_in[9], _inv[9]);
invert _i10(reg_in[10], _inv[10]);
invert _i11(reg_in[11], _inv[11]);
invert _i12(reg_in[12], _inv[12]);
invert _i13(reg_in[13], _inv[13]);
invert _i14(reg_in[14], _inv[14]);
invert _i15(reg_in[15], _inv[15]);
invert _i16(reg_in[16], _inv[16]);
invert _i17(reg_in[17], _inv[17]);
invert _i18(reg_in[18], _inv[18]);
invert _i19(reg_in[19], _inv[19]);

mux4x1 _mux0(reg_in[0], _inv[0], reg_in[1], 1'b0, j1, j0, o[0]);
mux4x1 _mux1(reg_in[1], _inv[1], reg_in[2], reg_in[0], j1, j0, o[1]);
mux4x1 _mux2(reg_in[2], _inv[2], reg_in[3], reg_in[1], j1, j0, o[2]);
mux4x1 _mux3(reg_in[3], _inv[3], reg_in[4], reg_in[2], j1, j0, o[3]);
mux4x1 _mux4(reg_in[4], _inv[4], reg_in[5], reg_in[3], j1, j0, o[4]);
mux4x1 _mux5(reg_in[5], _inv[5], reg_in[6], reg_in[4], j1, j0, o[5]);
mux4x1 _mux6(reg_in[6], _inv[6], reg_in[7], reg_in[5], j1, j0, o[6]);
mux4x1 _mux7(reg_in[7], _inv[7], reg_in[8], reg_in[6], j1, j0, o[7]);
mux4x1 _mux8(reg_in[8], _inv[8], reg_in[9], reg_in[7], j1, j0, o[8]);
mux4x1 _mux9(reg_in[9], _inv[9], reg_in[10], reg_in[8], j1, j0, o[9]);
mux4x1 _mux10(reg_in[10], _inv[10], reg_in[11], reg_in[9], j1, j0, o[10]);
mux4x1 _mux11(reg_in[11], _inv[11], reg_in[12], reg_in[10], j1, j0, o[11]);
mux4x1 _mux12(reg_in[12], _inv[12], reg_in[13], reg_in[11], j1, j0, o[12]);
mux4x1 _mux13(reg_in[13], _inv[13], reg_in[14], reg_in[12], j1, j0, o[13]);
mux4x1 _mux14(reg_in[14], _inv[14], reg_in[15], reg_in[13], j1, j0, o[14]);
mux4x1 _mux15(reg_in[15], _inv[15], reg_in[16], reg_in[14], j1, j0, o[15]);
mux4x1 _mux16(reg_in[16], _inv[16], reg_in[17], reg_in[15], j1, j0, o[16]);
mux4x1 _mux17(reg_in[17], _inv[17], reg_in[18], reg_in[16], j1, j0, o[17]);
mux4x1 _mux18(reg_in[18], _inv[18], reg_in[19], reg_in[17], j1, j0, o[18]);
mux4x1 _mux19(reg_in[19], _inv[19], 1'b0, reg_in[18], j1, j0, o[19]);	
endmodule

module general_purpose_register1(input wire clk,reset,load, input wire [19:0] i, input wire [9:0] j, output wire [19:0] o);
wire [19:0] out;
mux m_0(i, j[0], j[1], out);
dff d_0(clk, reset, load, out, o);
endmodule

module general_purpose_register2(input wire clk,reset,load, input wire [19:0] i, input wire [9:0] j, output wire [19:0] o);
wire [19:0] out;
mux m_0(i, j[0], j[1], out);
dff d_0(clk, reset, load, out, o);
endmodule

module general_purpose_register3(input wire clk,reset,load, input wire [19:0] i, input wire [9:0] j, output wire [19:0] o);
wire [19:0] out;
mux m_0(i, j[0], j[1], out);
dff d_0(clk, reset, load, out, o);
endmodule

module general_purpose_register4(input wire clk,reset,load, input wire [19:0] i, input wire [9:0] j, output wire [19:0] o);
wire [19:0] out;
mux m_0(i, j[0], j[1], out);
dff d_0(clk, reset, load, out, o);
endmodule

module general_purpose_register5(input wire clk,reset,load, input wire [19:0] i, input wire [9:0] j, output wire [19:0] o);
wire [19:0] out;
mux m_0(i, j[0], j[1], out);
dff d_0(clk, reset, load, out, o);
endmodule

module general_purpose_register6(input wire clk,reset,load, input wire [19:0] i, input wire [9:0] j, output wire [19:0] o);
wire [19:0] out;
mux m_0(i, j[0], j[1], out);
dff d_0(clk, reset, load, out, o);
endmodule

module instruction_segment_register(input wire clk,reset,load, input wire [19:0] i, input wire [9:0] j, output wire [19:0] o);
wire [19:0] out;
mux m_0(i, j[0], j[1], out);
dff d_0(clk, reset, load, out, o);
endmodule

module static_segment_register(input wire clk,reset,load, input wire [19:0] i, input wire [9:0] j, output wire [19:0] o);
wire [19:0] out;
mux m_0(i, j[0], j[1], out);
dff d_0(clk, reset, load, out, o);
endmodule

module dynamic_segment_register(input wire clk,reset,load, input wire [19:0] i, input wire [9:0] j, output wire [19:0] o);
wire [19:0] out;
mux m_0(i, j[0], j[1], out);
dff d_0(clk, reset, load, out, o);
endmodule

module instruction_pointer_register(input wire clk,reset,load, input wire [19:0] i, input wire [9:0] j, output wire [19:0] o);
wire [19:0] out;
mux m_0(i, j[0], j[1], out);
dff d_0(clk, reset, load, out, o);
endmodule

module static_pointer_register(input wire clk,reset,load, input wire [19:0] i, input wire [9:0] j, output wire [19:0] o);
wire [19:0] out;
mux m_0(i, j[0], j[1], out);
dff d_0(clk, reset, load, out, o);
endmodule

module dynamic_pointer_register(input wire clk,reset,load, input wire [19:0] i, input wire [9:0] j, output wire [19:0] o);
wire [19:0] out;
mux m_0(i, j[0], j[1], out);
dff d_0(clk, reset, load, out, o);
endmodule

