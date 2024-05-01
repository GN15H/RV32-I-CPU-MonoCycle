module flip_flop_tb;
  reg D;
  reg clk;
  reg en;
  wire Q;

  // Instantiate the FlipFlop module
  flip_flop uut (
    .D(D),
    .en(en),
    .clk(clk),
    .Q(Q)
  );

  // Clock generation
  always #5 clk = ~clk; 
  always #8 en = ~en;

  // Stimulus
  initial begin
    $dumpfile("ff.vcd");  // VCD file for waveform dumping
    $dumpvars(0, flip_flop_tb);
    // Initialize signals
    clk = 0;
    D = 0;
    en = 1;

    // Apply input values and observe outputs
    #10 D = 1;
    #10 D = 0;
    #10 D = 1;
    #10 D = 0;

    #10 $finish;
  end
endmodule