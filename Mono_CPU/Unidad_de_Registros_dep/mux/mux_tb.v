module mux_tb;
  parameter amount_of_bits = 32;
  parameter amount_of_inputs = 4;

  reg [amount_of_inputs-1:0][amount_of_bits-1:0] A;
  reg [$clog2(amount_of_inputs):0] selector;
  wire [amount_of_bits-1:0] S;

  // Instantiate the FlipFlop module
  mux uut (
    .A(A),
    .selector(selector),
    .S(S)
  );

  // Stimulus
  initial begin
    $dumpfile("mux.vcd");  // VCD file for waveform dumping
    $dumpvars(0, mux_tb);
    // Initialize signals
    A[0] = 32'H00000000; A[1] = 32'H0000000F; A[2] = 32'H000000F0; A[3] = 32'H000000F0;
    selector = 2'b00;

    // Apply input values and observe outputs
    #10 A[0] = 32'H00000000; A[1] = 32'H0000000F; A[2] = 32'H000000F0; A[3] = 32'H000000FF;
    selector = 2'b01;
    #10 A[0] = 32'H00000000; A[1] = 32'H0000000F; A[2] = 32'H000000F0; A[3] = 32'H000000FF;
    selector = 2'b10;
    #10 A[0] = 32'H00000000; A[1] = 32'H0000000F; A[2] = 32'H000000F0; A[3] = 32'H000000FF;
    selector = 2'b11;

    
    #10 $finish;
  end
endmodule