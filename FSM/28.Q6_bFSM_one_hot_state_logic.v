//IF you try to do with the logic use in the previous code then you will find some mismatches ,reason maybe test bech is written differently
module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);
    assign Y2 = ~w & y[1] ;
    assign Y4 =  w & (y[2] | y[3] | y[5] | y[6] ) ;
endmodule
   
