module register_unit_tb;
  parameter amount_of_bits = 32;
  parameter amount_of_regs = 4;

  reg clk;
  reg [$clog2(amount_of_regs):0] rs1;
  reg [$clog2(amount_of_regs):0] rs2;
  reg [$clog2(amount_of_regs):0] rd;
  reg [amount_of_bits-1:0] ru_data_wr;
  reg ru_wr;
  wire [amount_of_bits-1:0] ru_rs1;
  wire [amount_of_bits-1:0] ru_rs2;

  // Instantiate the register_unit module
  register_unit uut (
    .clk(clk),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .ru_data_wr(ru_data_wr),
    .ru_wr(ru_wr),
    .ru_rs1(ru_rs1),
    .ru_rs2(ru_rs2)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Stimulus
  initial begin
    $dumpfile("dump.vcd");  // VCD file for waveform dumping
    $dumpvars(0, register_unit_tb);

    // Initialize signals
    clk = 0;
    rs1 = 2'b00;
    rs2 = 2'b01;
    rd = 2'b10;
    ru_data_wr = 32'h12345678;
    ru_wr = 1;

    // Apply stimulus
    #20 ru_wr = 0; // deassert write signal
    #20 rs1 = 2'b10; // change rs1
    #20 rs2 = 2'b11; // change rs2
    #20 rd = 2'b01; // change rd
    #20 ru_data_wr = 32'h87654321; // change write data
    #20 ru_wr = 1; // assert write signal
    #20 ru_wr = 0; // deassert write signal

    #100 $finish;
  end
endmodule
