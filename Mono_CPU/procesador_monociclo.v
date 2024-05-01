`include "PC/program_counter.v"
`include "Instruction_Memory/instruction_memory.v"
`include "Unidad_de_Control/control_unit.v"
`include "Imm_Generator/imm_gen.v"
`include "Registers_Unit/reg_unit.v"
`include "ALU/alu.v"
`include "Data_Memory/data_memory.v"
`include "Branch_Unit/branch_unit.v"

module cpu_mono(
    input clk
);

  //pc signals
  logic [31:0] pc_input_signal;
  logic [31:0] pc_output_signal;

  //instruction memory signals
  logic [31:0] instruction_signal;

  //control unit signals
  logic RUWr_signal, AlUASrc_signal, AlUBSrc_signal, DMWr_signal;
  logic [1:0] RUDataWrSrc_signal;
  logic [2:0] DMCtrl_signal, ImmSrc_signal;
  logic [3:0] ALUOp_signal;
  logic [4:0] BrOp_signal;

  //imm gen signals
  logic [31:0] ImmExt_signal;

  //reg_unit signals
  logic [31:0] RURs1_signal, RURs2_signal, DataWr_signal;

  //branch_unit signals

  //alu signals
  logic [31:0] ALURes;

  //data memory signals
  logic [31:0] DataRd_signal;

  //branch unit signals
  logic NextPCSrc_signal;

  initial begin
    pc_input_signal = 32'h00000000;

    //pc_output_signal = 32'h00000000;
  end

  program_counter pc(
    .clk(clk),
    .pc_input(pc_input_signal), 
    .pc_output(pc_output_signal)
  );

  instruction_memory ins_mem(
    .program_counter(pc_output_signal),
    .instruction(instruction_signal)
  );
  
  control_unit c_u(
    .OpCode(instruction_signal[6:0]),
    .Funct3(instruction_signal[14:12]),
    .Funct7(instruction_signal[31:25]),
    //outputs
    .RUWr(RUWr_signal),
    .AlUASrc(AlUASrc_signal),
    .AlUBSrc(AlUBSrc_signal),
    .DMWr(DMWr_signal),
    .RUDataWrSrc(RUDataWrSrc_signal),
    .DMCtrl(DMCtrl_signal),
    .ImmSrc(ImmSrc_signal),
    .ALUOp(ALUOp_signal),
    .BrOp(BrOp_signal)
  );

  imm_gen imm_gen_module(
    .imm(instruction_signal[31:7]),
    .ImmSrc(ImmSrc_signal),
    .ImmExt(ImmExt_signal)
  );

  register_unit ru(
    .clk(clk),
    .rs1(instruction_signal[19:15]),
    .rs2(instruction_signal[24:20]),
    .rd(instruction_signal[11:7]),
    .DataWr(
      RUDataWrSrc_signal === 2'b00 ? ALURes:
      RUDataWrSrc_signal === 2'b01 ? DataRd_signal:
      pc_output_signal+4
      ),
    .RUWr(RUWr_signal),
    .RURs1(RURs1_signal),
    .RURs2(RURs2_signal)
  );

  branch_unit br_u(
    .rs1(RURs1_signal),
    .rs2(RURs2_signal),
    .BrOp(BrOp_signal),
    .NextPCSrc(NextPCSrc_signal)
  );
  
  ALU alu_unit(
    .A((AlUASrc_signal ? pc_output_signal : RURs1_signal)),
    .B((AlUBSrc_signal ? ImmExt_signal : RURs2_signal)),
    .AluOp(ALUOp_signal),
    .S(ALURes)
  );

  data_memory data_mem(
    .Address(ALURes),
    .DataWr(RURs2_signal),
    .DMCtrl(DMCtrl_signal),
    .DMWr(DMWr_signal),
    .DataRd(DataRd_signal)
  );


  always @(pc_output_signal, NextPCSrc_signal, ALURes) begin
    if(NextPCSrc_signal === 1)
      pc_input_signal <= ALURes;
    else
      pc_input_signal <= pc_output_signal + 4;
  end

endmodule


