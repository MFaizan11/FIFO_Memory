module Memory #(
   parameter n = 3,       // n address bits
   parameter N = 8,       // N data bits
   parameter SIZE = 8     // size of 
) (
   input clk, rst, fifo_full, fifo_empty, write, read,
   input [n-1:0] write_addr, read_addr, input [N-1:0] data_in,
   output reg [N-1:0] data_out
);

  reg [N-1:0] MEM [SIZE-1:0];
  integer i;

  initial begin
    $writememh("memory.mem", MEM);
  end

  // Asynchronous active low reset
  always @(posedge clk or negedge rst) begin
    if (~rst) begin
      for (i = 0; i < SIZE; i = i + 1) begin
              MEM[i] <= 8'h0;
         end
    end
  end

  // Write Operation
  always @(posedge clk) begin
    if (write && ~fifo_full) begin
        MEM[write_addr] <= data_in;
    end 
  end
  
  // Read Operation
  always @(posedge clk) begin
   if (read && ~fifo_empty) begin
   // always @(*) begin
     // if (read && ~fifo_empty) begin 
        data_out = MEM[read_addr];
     // end
   // end
  end 
  end
  
endmodule 