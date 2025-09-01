module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    wire[7:0] d1;
    always @ ( posedge clk ) begin
        d1 <= in ;
        anyedge <= (in & ~d1) | (d1 & ~in) ;
    end

endmodule
