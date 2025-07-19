    module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  ); //

        wire[7:0]  mux_1, mux_3;
        mux2 mux0( .sel(sel[0]),  .a(a),    .b(b), .out(mux_1) );
        mux2 mux1 ( .sel(sel[0]),    .a(c),    .b(d), .out(mux_3) );
        mux2 mux_o ( .sel(sel[1]), .a(mux_1), .b(mux_3),  .out(out) );

endmodule


