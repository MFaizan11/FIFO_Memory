module Write_Buffer #(
    parameter n = 3    // n write address bits
) (
   input clk, rst, write, fifo_full,
   output reg [n-1:0] write_addr
);
 
    wire fifo_write_en;

    assign fifo_write_en = (~fifo_full) & write;  
    
    always @(posedge clk or negedge rst) begin  
        if (~rst) begin
           write_addr <= 0;  
        end 
        else if (fifo_write_en) begin
           write_addr <= write_addr + 1;    
        end  
        else begin
           write_addr <= 0;  
        end 
    end 

endmodule