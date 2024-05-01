module program_counter(
    input clk, 
    input logic [31:0] pc_input, 
    output logic [31:0] pc_output
    );
    
    always @ (posedge clk)
        pc_output <= pc_input;

endmodule

