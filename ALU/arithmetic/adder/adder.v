module adder (
   input [19:0] a,
   input [19:0] b,
   output reg [19:0] o
);

   integer i;

   always @(a or b) begin
      for (i = 0; i < 20; i++) begin
         o[i] = a[i] + b[i];
      end
   end  

endmodule