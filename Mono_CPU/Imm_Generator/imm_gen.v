module imm_gen (
    input [24:0] imm, 
    input [2:0] ImmSrc, 
    output reg [31:0] ImmExt
    );

    always @* begin
        case(ImmSrc)
            3'b000: ImmExt = {(imm[24] ? 20'hfffff : 20'h00000), imm[24:13]};//I
            3'b001: ImmExt = {(imm[24]? 20'hfffff : 20'h00000), imm[24:18], imm[4:0]}; //S
            3'b101: ImmExt = {(imm[24]? {18'o777777, 1'b1} : {18'o000000, 1'b0}), imm[24], imm[0], imm[23:18], imm[4:1], 1'b0}; //B
            3'b010: ImmExt = {imm[24:5], 12'b0}; //U
            3'b110: ImmExt = {(imm[24]? {8'hff, 3'o7} : {8'h00, 3'o0}), imm[24], imm[12:5], imm[13], imm[23:14], 1'b0};  //J
            default: ImmExt = {20'b0, imm[24:13]};
        endcase
    end

endmodule