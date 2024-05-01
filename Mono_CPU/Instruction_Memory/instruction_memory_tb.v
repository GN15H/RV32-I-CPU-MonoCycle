module instruction_memory_tb;

  logic [31:0] program_counter;
  logic [31:0] instruction;

  instruction_memory dut (
    .program_counter(program_counter),
    .instruction(instruction)
  );

  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars(0, instruction_memory_tb);
    // Initialize program_counter
    program_counter = 0;
    
    // Wait for some time for memory initialization
    #100;

    // Read and display the first 10 instructions
    for (int i = 0; i < 22; i = i + 1) begin
      #10; // Advance simulation time
      program_counter = program_counter + 4;
    end
    
    // End of simulation
    $finish;
  end

endmodule
