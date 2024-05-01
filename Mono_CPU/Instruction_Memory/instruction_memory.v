module instruction_memory(
    input logic [31:0] program_counter,
    output logic [31:0] instruction
    );
    logic [7:0] memory [0:512];
    initial begin
        $readmemh("mul.mem", memory);
    end
    assign instruction = {
        memory[program_counter],
        memory[program_counter+1],
        memory[program_counter+2],
        memory[program_counter+3]};

endmodule
