module branch_unit_tb;

  logic [31:0] rs1;
  logic [31:0] rs2;
  logic [4:0] BrOp;
  logic NextPCSrc;

  branch_unit dut (
    .rs1(rs1),
    .rs2(rs2),
    .BrOp(BrOp),
    .NextPCSrc(NextPCSrc)
  );

  initial begin
    $dumpfile("dump.vcd");  
    $dumpvars(0, branch_unit_tb);
    // Branch always (5'b1xxxx)
    rs1 = 32'h00000001;
    rs2 = 32'h00000001;
    BrOp = 5'b10000;
    #10;
    //Branch never (5'b00xxx)
    rs1 = 32'h00000001;
    rs2 = 32'h00000000;
    BrOp = 5'b00000;
    #10; // Wait for 10 time units
    //Branch equal (5'b01000)
    rs1 = 32'h00000010;
    rs2 = 32'h00000010;
    BrOp = 5'b01000;
    #10;
    //Branch not equal (5'b01001)
    rs1 = 32'h00000001;
    rs2 = 32'h00000001;
    BrOp = 5'b01001;
    #10;
    // Branch less than (signed) (5'b01100)
    rs1 = 32'hf0000003;
    rs2 = 32'h00000002;
    BrOp = 5'b01100;
    #10;
    //Branch greater than or equal to (signed) (5'b01101)
    rs1 = 32'h00000002;
    rs2 = 32'h00000004;
    BrOp = 5'b01101;
    #10; 
    //Branch less than (unsigned) (5'b01110)
    rs1 = 32'h00000001;
    rs2 = 32'h00000002;
    BrOp = 5'b01110;
    #10;
    //Branch greater than or equal to (unsigned) (5'b01111)
    rs1 = 32'h00000002;
    rs2 = 32'h00000001;
    BrOp = 5'b01111;
    #10; 
    $finish;
  end


endmodule
