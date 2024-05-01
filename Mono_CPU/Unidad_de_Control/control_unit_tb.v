module control_unit_tb;

  logic [6:0] OpCode;
  logic [2:0] Funct3;
  logic [6:0] Funct7;
  logic RUWr, AlUASrc, AlUBSrc, DMWr;
  logic [1:0] RUDataWrSrc;
  logic [2:0] DMCtrl, ImmSrc;
  logic [3:0] ALUOp;
  logic [4:0] BrOp;

  control_unit dut (
    .OpCode(OpCode),
    .Funct3(Funct3),
    .Funct7(Funct7),
    .RUWr(RUWr),
    .AlUASrc(AlUASrc),
    .AlUBSrc(AlUBSrc),
    .DMWr(DMWr),
    .RUDataWrSrc(RUDataWrSrc),
    .DMCtrl(DMCtrl),
    .ImmSrc(ImmSrc),
    .ALUOp(ALUOp),
    .BrOp(BrOp)
  );

  initial begin
    $dumpfile("dump.vcd");  
    $dumpvars(0, control_unit_tb);
    // Test case 1 beq
    OpCode = 7'b1100011;
    Funct3 = 3'b000;
    Funct7 = 7'b0100000;
    #10; 
    // bne
    OpCode = 7'b1100011;
    Funct3 = 3'b001;
    Funct7 = 7'b0000000;
    #10; 
    //blt
    OpCode = 7'b1100011;
    Funct3 = 3'b100;
    Funct7 = 7'b0000000;
    #10; 
    //bge
    OpCode = 7'b1100011;
    Funct3 = 3'b101;
    Funct7 = 7'b0000000;
    #10; 
    //bltu
    OpCode = 7'b1100011;
    Funct3 = 3'b110;
    Funct7 = 7'b0000000;
    #10;
    //bgeu
    OpCode = 7'b1100011;
    Funct3 = 3'b111;
    Funct7 = 7'b0100000;
    #10;
    //jal
    OpCode = 7'b1101111;
    Funct3 = 3'b000;
    Funct7 = 7'b0000000;
    #10;
    //jalr
    OpCode = 7'b1100111;
    Funct3 = 3'b000;
    Funct7 = 7'b0000000;
    #10;
  end

endmodule
