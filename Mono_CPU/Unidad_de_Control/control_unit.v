module control_unit(
  input [6:0] OpCode,
  input [2:0] Funct3,
  input [6:0] Funct7,

  output RUWr,
  output AlUASrc,
  output AlUBSrc,
  output DMWr,
  output [1:0]RUDataWrSrc,
  output [2:0]DMCtrl,
  output [2:0]ImmSrc,
  output [3:0]ALUOp,
  output [4:0]BrOp
  
);
  
  assign AlUASrc = OpCode[6] === 1'b1 & OpCode !== 7'b1100111;
  assign AlUBSrc = OpCode !== 8'b0110011;
  assign RUWr = OpCode[5:2] !== 4'b1000;
  assign DMWr = OpCode[6:4] === 3'b010;
  assign RUDataWrSrc = {OpCode[6], ~OpCode[4]} - OpCode[6];
  assign DMCtrl = Funct3;
  assign ALUOp = (OpCode === 7'b0110011 || OpCode === 7'b0010011 ? {(OpCode === 7'b0110011 || Funct3 === 3'b101 ? Funct7[5]: 1'b0 ), Funct3} : 4'b0000);
  assign ImmSrc = {(OpCode === 7'b1101111) | (OpCode === 7'b1100011),(OpCode[2:0] === 3'b111) & (OpCode[4:3] > 3'b00), (OpCode[5:2] === 4'b1000)};
  assign BrOp = {(OpCode[2] & OpCode[6]), OpCode[6],Funct3};

endmodule
