module Read_Buffer #(
    parameter n = 3   // n read address bits
) (
   input clk, rst, read, fifo_empty,
   output reg [n-1:0] read_addr
);
 
    wire fifo_read_en;

    assign fifo_read_en = (~fifo_empty) & read;  
    
    always @(posedge clk or negedge rst) begin  
        if (~rst) begin
           read_addr <= 0;  
        end 
        else if (fifo_read_en) begin
           read_addr <= read_addr + 1;    
        end  
        else begin
           read_addr <= 0;  
        end 
    end 

endmodule  