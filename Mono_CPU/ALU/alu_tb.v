module testbench_my_mux;

  reg [31:0] A, B;
  reg [3:0] AluOp;
  
  wire [31:0] S;

  ALU uut (
    .A(A),
    .B(B),
    .AluOp(AluOp),
    .S(S)
  );

  initial begin
    $dumpfile("dump.vcd");  
    $dumpvars(0, testbench_my_mux);

   // Test case 1: Addition (AluOp = 4'b0000)
    A = 5;
    B = 3;
    AluOp = 4'b0000;
    #10; 
    // Test case 2: Subtraction (AluOp = 4'b1000)
    A = 8;
    B = 3;
    AluOp = 4'b1000;
    #10;
    // Test case 3: Left shift (AluOp = 4'b0001)
    A = 4;
    B = 2;
    AluOp = 4'b0001;
    #10;
    // Test case 4: Signed comparison (AluOp = 4'b0010)
    A = -5;
    B = 3;
    AluOp = 4'b0010;
    #10; 
    // Test case 5: Unsigned comparison (AluOp = 4'b0011)
    A = 5;
    B = 3;
    AluOp = 4'b0011;
    #10; 
    // Test case 6: Bitwise logic (AluOp = 4'b0100)
    A = 5;
    B = 3;
    AluOp = 4'b0100;
    #10; 
    // Test case 7: Right shift (AluOp = 4'b0101)
    A = 8;
    B = 2;
    AluOp = 4'b0101;
    #10;
    // Test case 8: Logical right shift (AluOp = 4'b1101)
    A = -8;
    B = 2;
    AluOp = 4'b1101;
    #10; 
    // Test case 9: Bitwise OR (AluOp = 4'b0110)
    A = 5;
    B = 3;
    AluOp = 4'b0110;
    #10;
    // Test case 10: Bitwise AND (AluOp = 4'b0111)
    A = 5;
    B = 3;
    AluOp = 4'b0111;
    #10; // Wait for 10 time units
    // End of simulation
    $finish;
  end

endmodule
