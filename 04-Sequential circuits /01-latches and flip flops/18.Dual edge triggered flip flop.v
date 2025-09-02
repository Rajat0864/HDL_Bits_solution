module top_module (
    input clk,
    input d,
    output reg q
);
    reg temp1, temp2;           
    
    always @(posedge clk) begin
        temp1 <= d;
    end
    
    always @(negedge clk) begin
        temp2 <= d;
    end
    
  assign q = clk ? temp1 : temp2 ;
 
endmodule
