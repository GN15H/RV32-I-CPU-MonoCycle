module data_memory(
    input [31:0] Address,
    input [31:0] DataWr,
    input [2:0] DMCtrl,
    input DMWr,
    output logic [31:0] DataRd
    );
    
     logic [7:0] memory[800:0];

  always @(Address or DataWr or DMCtrl or DMWr) begin
    case (DMCtrl)
      3'b000:  DataRd <= {{24{memory[Address][7]}}, memory[Address]};
      3'b001:  DataRd <= {{16{memory[Address+1][7]}}, memory[Address+1], memory[Address]};
      3'b010:  DataRd <= {memory[Address+3], memory[Address+2], memory[Address+1], memory[Address]};
      3'b100:  DataRd <= {{24{1'b0}}, memory[Address]};
      3'b101:  DataRd <= {{16{1'b0}}, memory[Address+1], memory[Address]};
      default: DataRd <= 0;
    endcase
    if (DMWr)
      #1
      if (DMCtrl == 3'b000) 
        memory[Address] <= DataWr[7:0];
      else if (DMCtrl == 3'b001) begin
        memory[Address]   <= DataWr[7:0];
        memory[Address+1] <= DataWr[15:8];
      end else if (DMCtrl == 3'b010) begin
        memory[Address]   <= DataWr[7:0];
        memory[Address+1] <= DataWr[15:8];
        memory[Address+2] <= DataWr[23:16];
        memory[Address+3] <= DataWr[31:24];
      end
    
  end //always

endmodule