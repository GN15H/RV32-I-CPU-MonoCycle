module program_counter_tb;

  logic [31:0] pc_input, pc_output;
  logic clk;

  program_counter dut(
    .clk(clk),
    .pc_input(pc_input),
    .pc_output(pc_output)
  );


  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,program_counter_tb);

    pc_input = 32'h00000000;
    #10 //0

    pc_input = 32'h00000001;
    #10 //10

    pc_input = 32'h00000002;
    #10 //20
    pc_input = 32'h00000003;
    #10 //30
    pc_input = 32'h00000004;
    #10 //40

  
    $finish;
  end





endmodule