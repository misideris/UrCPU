module xor_word (
   input [19:0] a,
   input [19:0] b,
   output reg [19:0] c,
   output reg zero
);

   integer i;

   always @(a or b) begin
      for (i = 0; i < 20; i++) begin
         c[i] = a[i] ^ b[i];
      end
    
      zero = !(|c);
   end  

endmodule