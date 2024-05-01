// Code your design here
module flip_flop(input D, input clk, input en, output reg Q);
  always @ (posedge clk)
    if(en)
      Q <= D;
endmodule
