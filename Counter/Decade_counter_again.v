module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    always@(posedge clk)begin
      if(reset) begin /*Don't try to put else if condition with reset bcoz reset should unconditionally reset the counter.*/
            q <= 1;
        end
        
      else if (q==10) begin //here is also litte bit difference from the previous code
            q <= 1;
         end
           else begin
             q<=q+1;
           end
    end

endmodule
