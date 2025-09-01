module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    reg d ;
    assign d = (Q & ~k) | (~Q & j);
    always @ ( posedge clk ) begin 
        Q <= d ; 
    end
endmodule
