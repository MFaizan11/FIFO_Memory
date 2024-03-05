module FIFO_Memory #(
  parameter n = 3,     // n address bits
  parameter N = 8,     // N data bits
  parameter SIZE = 8   // size of memory
) (
  input clk, rst, write, read,
  input [N-1:0] data_in,
  output wire [N-1:0] data_out,
  output wire fifo_full, fifo_empty, fifo_overflow, fifo_underflow
);
  
  wire [n-1:0] read_addr;
  wire [n-1:0] write_addr;        

  Write_Buffer #(.n(3)
  )
  WB(
    .clk(clk),
    .rst(rst),
    .write(write),
    .fifo_full(fifo_full),
    .write_addr(write_addr)
  );

  Read_Buffer #(.n(3)
  )
  RB(
    .clk(clk),
    .rst(rst),
    .read(read),
    .fifo_empty(fifo_empty),
    .read_addr(read_addr)
  ); 

  FIFO_Status #(.n(3),
                .SIZE(8)
  )
  FS(
    .clk(clk),
    .rst(rst),
    .write(write),
    .read(read),
    .write_addr(write_addr),
    .read_addr(read_addr),
    .fifo_full(fifo_full),
    .fifo_empty(fifo_empty),
    .fifo_overflow(fifo_overflow), 
    .fifo_underflow(fifo_underflow)
  );

  Memory #(.n(3),
           .N(8),
           .SIZE(8)
  )
  Mem(
    .clk(clk),
    .rst(rst),
    .fifo_full(fifo_full),
    .fifo_empty(fifo_empty),
    .write(write),
    .read(read),
    .write_addr(write_addr),
    .read_addr(read_addr),
    .data_in(data_in),
    .data_out(data_out)
  );

endmodule  
