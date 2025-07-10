module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    always@(posedge clk)begin
        if(reset) begin
            q<='0; //('0 means set all bits of q to zero)
        end
        else begin
            q<=q+1;
        end
    end

endmodule
