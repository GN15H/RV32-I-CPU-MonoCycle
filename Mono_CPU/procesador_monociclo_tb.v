module cpu_mono_tb;

  logic clk;

  cpu_mono dut(
      .clk(clk)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,cpu_mono_tb);
    #1340
    $finish;
  end

endmodule