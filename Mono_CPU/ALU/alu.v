module ALU(A, B, AluOp, S);
  input [31:0] A, B;
  input [3:0] AluOp;
  output reg [31:0] S;

  always @* begin
    case (AluOp)
      4'b0000: S = A + B;
      4'b1000: S = A - B;
      4'b0001: S = A << B[4:0];
      4'b0010: S = ($signed(A) < $signed(B)) ? 1 : 0;
      4'b0011: S = (A < B) ? 1 : 0;
      4'b0100: S = A ^ B;
      4'b0101: S = A >> B[4:0];
      4'b1101: S = $signed(A) >>> B[4:0];
      4'b0110: S = A | B;
      4'b0111: S = A & B;
      default: S = 4'b0; 
    endcase
  end
endmodule
