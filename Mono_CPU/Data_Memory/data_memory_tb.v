module data_memory_tb;

logic [31:0] Address;
logic [31:0] DataWr;
logic [2:0] DMCtrl;
logic DMWr;
logic [31:0] DataRd;

data_memory dut(
  .Address(Address),
  .DataWr(DataWr),
  .DMCtrl(DMCtrl),
  .DMWr(DMWr),
  .DataRd(DataRd)
);

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,data_memory_tb);

    //store at address 0 value 8 in byte format
    Address = 0;
    DataWr= 32'h00000008;
    DMCtrl= 3'b000;
    DMWr = 1;
    #10 //0

    //read at address 0 value 8 in unsigned byte format
    Address = 0;
    DataWr= 32'h0000ffff;
    DMCtrl= 3'b100;
    DMWr = 0;
    #10 //80

    //store at address 1 value -2 in half-word format
    Address = 1;
    DataWr= 32'h0000fffe;
    DMCtrl= 3'b001;
    DMWr = 1;
    #10 //10

    //store at address 3 value 2**32 -1 in word format
    Address = 3;
    DataWr= 32'h80000001;
    DMCtrl= 3'b010;
    DMWr = 1;
    #10 //20

    //read at address 10 unknown values
    Address = 10;
    DataWr= 32'h00000008;
    DMCtrl= 3'b000;
    DMWr = 0;
    #10 //30

    //read at address 0 value 8 byte format
    Address = 0;
    DataWr= 32'h00000018;
    DMCtrl= 3'b000;
    DMWr = 0;
    #10 //40
    
    // read at address 1 value -2 in half word format
    Address = 1;
    DataWr= 32'h0fff0ffe;
    DMCtrl= 3'b001;
    DMWr = 0;
    #10 //50

    //read at address 3 value 2**32 -1 in word format
    Address = 3;
    DataWr= 32'h8010f001;
    DMCtrl= 3'b010;
    DMWr = 0;
    #10 //60

    //read at address 1 value fffe in unsigned half-word format
    Address = 1;
    DataWr= 32'h0000ffff;
    DMCtrl= 3'b101;
    DMWr = 0;
    #10 //70

    $finish;

  end
endmodule