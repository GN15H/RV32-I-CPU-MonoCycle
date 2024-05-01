module imm_gen_tb;

  logic [24:0] imm;
  logic [2:0] ImmSrc;
  logic [31:0] ImmExt;

  imm_gen dut (
    .imm(imm),
    .ImmSrc(ImmSrc),
    .ImmExt(ImmExt)
  );

  initial begin
    $dumpfile("dump.vcd");  
    $dumpvars(0, imm_gen_tb);
    // type I
    imm = 25'b0000000011110000000000000;  
    ImmSrc = 3'b000;
    #10; 
    //type S
    imm = 25'b1000000000000000000000010;
    ImmSrc = 3'b001;
    #10; 
    //type B 
    imm = 25'b0000001000000000000000010; 
    ImmSrc = 3'b101;
    #10; 
    //type U
    imm = 25'b0000000000000000000100000; 
    ImmSrc = 3'b010;
    #10; //
    //type J
    imm = 25'b0000000000100000000100000; 
    ImmSrc = 3'b110;
    #10; 
    $finish;
  end

endmodule
