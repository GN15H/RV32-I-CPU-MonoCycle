`include "register.v"
`include "mux_n_1.v"

// Code your design here
module register_unit #(parameter amount_of_bits = 32, parameter amount_of_regs = 4) (
  input wire clk,

  input [$clog2(amount_of_regs):0] rs1,
  input [$clog2(amount_of_regs):0] rs2,

  input [$clog2(amount_of_regs):0] rd,
  input [amount_of_bits-1:0] ru_data_wr,
  input ru_wr,

  output [amount_of_bits-1:0] ru_rs1,
  output [amount_of_bits-1:0] ru_rs2
);

  wire [amount_of_regs-1:0][amount_of_bits-1:0] Q_rs;
  wire [amount_of_regs-1:0] rd_signal;

  mux mux_1(.A(Q_rs), .selector(rs1), .S(ru_rs1));
  mux mux_2(.A(Q_rs), .selector(rs2), .S(ru_rs2));

  assign rd_signal = (32'H00000000 + ru_wr) << rd; 

  genvar i;
  generate
    for (i = 0; i < amount_of_regs; i=i+1) begin : gen_regs
      register reg_i (
        .D_vector(ru_data_wr),
        .clk(clk),
        .Q_vector(Q_rs[i]),
        .en_reg(rd_signal[i])
      );
    end
  endgenerate

endmodule
