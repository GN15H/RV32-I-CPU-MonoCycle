module register_unit_tb;

  logic clk;
  logic [31:0] DataWr, RURs1, RURs2;
  logic [4:0] rs1,rs2,rd;
  logic RUWr;

  register_unit dut(
    .clk(clk),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .DataWr(DataWr),
    .RUWr(RUWr),
    .RURs1(RURs1),
    .RURs2(RURs2)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Stimulus
  initial begin
    $dumpfile("dump.vcd");  // VCD file for waveform dumping
    $dumpvars(0, register_unit_tb);

    //leer 1 y 2, escribir 8 en 1 
    rs1 = 1;
    rs2 = 2;
    rd = 1;
    DataWr = 32'h00000008;
    RUWr = 1;
    #20//0
    
    //leer 1 y 2, escribir 10 en 2 
    rs1 = 1;
    rs2 = 2;
    rd = 2;
    DataWr = 32'h0000000a;
    RUWr = 1;
    #20 //20

    //leer 1 y 2, escribir -2 en 3 
    rs1 = 1;
    rs2 = 2;
    rd = 3;
    DataWr = 32'hfffffffe;
    RUWr = 1;
    #20 //40

    //leer 3 y 2, no se escribe
    rs1 = 3;
    rs2 = 2;
    rd = 1;
    DataWr = 32'hfffffffe;
    RUWr = 0;
    #20 //60

    //leer 1 y 0, se prueba escribir en 0
    rs1 = 1;
    rs2 = 0;
    rd = 0;
    DataWr = 32'h00000001;
    RUWr = 1;
    #20 //80

    //leer 1 y 0, no se escribe
    rs1 = 1;
    rs2 = 0;
    rd = 0;
    DataWr = 32'h00000001;
    RUWr = 1;
    #20 //100

    $finish;
  end

endmodule
