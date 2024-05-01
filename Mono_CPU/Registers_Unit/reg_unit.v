module register_unit (
  input wire clk,
  input [4:0] rs1,
  input [4:0] rs2,
  input [4:0] rd,
  input [31:0] DataWr,
  input RUWr,
  output reg [31:0] RURs1,
  output reg [31:0] RURs2
);

  logic [31:0] RU [0:31];

  initial begin
    RU[0] = 32'h00000000;
    RU[1] = 32'h00000001;
    RU[2] = 32'h000000ff;
    RU[3] = 32'h00000003;
    RU[4] = 32'h00000004;
    RU[5] = 32'h00000005;
    RU[6] = 32'h00000006;
    RU[7] = 32'h00000007;
    RU[8] = 32'h00000008;
    RU[9] = 32'h00000009;
    RU[10] = 32'h0000000a;
    RU[11] = 32'h0000000b;
    RU[12] = 32'h0000000c;
  end
  
  assign RURs1 = RU[rs1]; 
  assign RURs2 = RU[rs2];

  always @(posedge clk) begin
    if(RUWr && rd != 0) 
      RU[rd] <= DataWr;
  end //always 
endmodule
