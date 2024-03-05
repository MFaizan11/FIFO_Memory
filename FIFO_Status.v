module FIFO_Status #(
    parameter n = 3,       // n address bits
    parameter SIZE = 8     // size of fifo
) ( 
   input clk, rst, write, read,
   input [n-1:0] write_addr, read_addr,
   output reg fifo_full, fifo_empty, fifo_overflow, fifo_underflow
);

  reg [n-1:0] counter;

  assign fifo_overflow = fifo_full & write;
  assign fifo_underflow = fifo_empty & read;

  always @(posedge clk or negedge rst) begin
    if (~rst) begin
      counter <= 0;
    end 
    else if (~fifo_full && write) begin 
      counter <= counter + 1;
    end
    else if (~fifo_empty && read) begin
      counter <= counter - 1;
    end
    else begin
      counter <= counter;
    end 
  end

  always @(counter) begin
      fifo_empty = (counter == 0);
      fifo_full = (counter == SIZE);
  end

endmodule
