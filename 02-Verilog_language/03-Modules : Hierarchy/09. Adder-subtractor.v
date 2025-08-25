module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire cout1, cout2 ;
    wire [15:0]sum1, sum2;
    wire[31:0]c;
    assign c = b ^ {32{sub}} ;
    add16 inst1 ( a[15:0], c[15:0], sub, sum1, cout1);
    add16 inst2 ( a[31:16], c[31:16], cout1, sum2, cout2);
    assign sum = { sum2,sum1 } ;

endmodule
