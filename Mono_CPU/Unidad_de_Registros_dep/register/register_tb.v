module register_tb;
  parameter amount = 32;

  reg [amount-1:0] D_vector;
  reg clk;
  reg en_reg;
  wire [amount-1:0] Q_vector;

  // Instantiate the FlipFlop module
  register uut (
    .D_vector(D_vector),
    .clk(clk),
    .en_reg(en_reg),
    .Q_vector(Q_vector)
  );

  // Clock generation
  always #5 clk = ~clk;
  always #8 en_reg = ~en_reg;

  // Stimulus
  initial begin
    $dumpfile("register_signals.vcd");  // VCD file for waveform dumping
    $dumpvars(0, register_tb);
    // Initialize signals
    clk = 0;
    D_vector = 0;
    en_reg = 1;

    // Apply input values and observe outputs
    #10 D_vector = 32'H00000000;
    #10 D_vector = 32'H0000000F;
    #10 D_vector = 32'HF0000000;
    #10 D_vector = 32'HFFFFFFFF;

    #10 $finish;
  end
endmodule