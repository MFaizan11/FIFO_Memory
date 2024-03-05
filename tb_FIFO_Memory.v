module tb_FIFO_Memory;

    reg clk, rst, write, read;    
    reg [7:0] data_in;

    wire [7:0] data_out;
    wire fifo_full, fifo_empty, fifo_overflow, fifo_underflow;


    FIFO_Memory dut(
    .clk(clk),
    .rst(rst),
    .write(write),
    .read(read),
    .data_in(data_in),
    .data_out(data_out),
    .fifo_full(fifo_full),
    .fifo_empty(fifo_empty),
    .fifo_overflow(fifo_overflow), 
    .fifo_underflow(fifo_underflow)
    );

    initial begin
       clk = 0;
       forever begin
           #10 clk <= ~clk;
       end
    end

    initial begin
        rst <= 0;
        @(posedge clk);
        @(posedge clk);
        rst <= 1;
        @(posedge clk);
        read <= 0;
        write <= 1;
        data_in <= 8'hea;
        @(posedge clk);
        read <= 1;
        data_in <= 8'h54;
        @(posedge clk);
        data_in <= 8'hff;
        @(posedge clk);
        data_in <= 8'he0;
        @(posedge clk);
        data_in <= 8'hd1;
        @(posedge clk);
        data_in <= 8'h7c;
        @(posedge clk);
        data_in <= 8'h09;
        @(posedge clk);
        data_in <= 8'hb6;
        @(posedge clk);
        read <= 1;
        write <= 0;
        @(posedge clk);
        read <= 0;
        @(posedge clk);
        $stop;
    end
    
    initial begin
        $monitor("read = %b, write = %b, data_in = %b, data_out = %b, fifo_full = %b, fifo_empty = %b, fifo_overflow = %b, fifo_underflow = %b, wr_addr = %b, rd_addr = %b", read, write,
                  data_in, data_out, fifo_full, fifo_empty, fifo_overflow, fifo_underflow, dut.FIFO_Memory.write_addr, dut.FIFO_Memory.read_addr);
    end

endmodule 