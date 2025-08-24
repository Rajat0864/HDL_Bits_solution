`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    wire OR ; 
    assign OR = (a & b ) | (c & d) ;
    assign out = OR ;
    assign out_n = ~ OR ;

endmodule
