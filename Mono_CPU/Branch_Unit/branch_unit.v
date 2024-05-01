module branch_unit (
    input [31:0] rs1,
    input [31:0] rs2,
    input logic [4:0] BrOp,
    output reg NextPCSrc
);

    always @(rs1, rs2, BrOp) begin
        if (BrOp[4] == 1'b1) 
            NextPCSrc <= 1;
        else if (BrOp[4:3] == 2'b00) 
            NextPCSrc <= 0;
        else if (BrOp == 5'b01000)
            NextPCSrc <= (rs1 === rs2);
        else if (BrOp == 5'b01001)
            NextPCSrc <= (rs1 !== rs2);
        else if (BrOp == 5'b01100)
            NextPCSrc <= ($signed(rs1) < $signed(rs2));
        else if (BrOp == 5'b01101)
            NextPCSrc <= ($signed(rs1) >= $signed(rs2));
        else if (BrOp == 5'b01110)
            NextPCSrc <= (rs1 < rs2);
        else if (BrOp == 5'b01111)
            NextPCSrc <= (rs1 >= rs2);
    end// always

endmodule
