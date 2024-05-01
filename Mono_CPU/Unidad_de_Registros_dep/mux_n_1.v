// Code your design here
module mux #(parameter amount_of_bits=32, parameter amount_of_inputs=4) ( 
  input [amount_of_inputs-1:0][amount_of_bits-1:0] A, 
  input [$clog2(amount_of_inputs):0] selector, 
  output reg [amount_of_bits-1:0] S
  );


  always @(A, selector) begin
    // Default assignment for S
    S = A[0];

    // Conditionally assign based on the selector
    for (int i = 0; i < amount_of_inputs; i = i + 1) begin
      if (i == selector) begin
        S = A[i];
      end
    end
  end

endmodule
