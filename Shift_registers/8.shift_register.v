module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
    MUXDFF inst0 (.clk(KEY[0]), .L(KEY[2]), .R(SW[0]), .E(KEY[1]), .w(LEDR[1]), .Q(LEDR[0]));
    MUXDFF inst1 (.clk(KEY[0]), .L(KEY[2]), .R(SW[1]), .E(KEY[1]), .w(LEDR[2]), .Q(LEDR[1]));
    MUXDFF inst2 (.clk(KEY[0]), .L(KEY[2]), .R(SW[2]), .E(KEY[1]), .w(LEDR[3]), .Q(LEDR[2]));
    MUXDFF inst3 (.clk(KEY[0]), .L(KEY[2]), .R(SW[3]), .E(KEY[1]), .w(KEY[3]),  .Q(LEDR[3]));
endmodule


module MUXDFF (
    input clk,
    input w, R, E, L,
    output reg Q
);
    always @(posedge clk) begin
        if (L) begin
            Q <= R;      
        end 
        else if (E) begin
            Q <= w;      
        end 
        
    end
endmodule
