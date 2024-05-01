`include "flip_flop.v"

// Code your design here
module register #(parameter amount = 32) (
  input wire clk,
  input [amount-1:0] D_vector,
  input en_reg,
  output reg [amount-1:0] Q_vector
);
  genvar i;
  generate
    for (i = 0; i < amount; i=i+1) begin : gen_flip_flops
      flip_flop ff (
        .D(D_vector[i]),
        .clk(clk),
        .Q(Q_vector[i]),
        .en(en_reg)
      );
    end
  endgenerate
endmodule
