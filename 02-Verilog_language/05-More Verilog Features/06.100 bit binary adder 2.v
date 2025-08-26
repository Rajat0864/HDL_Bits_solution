module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    wire [100:0] carry;
    assign carry[0] = cin ;
    genvar i ;
    generate
        for( i =0 ; i<=99 ; i++ ) begin : binary_adder
            assign { carry[i+1],sum[i]} = a[i] + b[i] + carry[i] ;
            assign cout[i] = carry[i+1] ;
        end
    endgenerate

endmodule
