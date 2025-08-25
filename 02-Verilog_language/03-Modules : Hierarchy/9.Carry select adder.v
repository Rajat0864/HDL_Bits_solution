module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
wire cout1, cout2, cout3 ;
    wire[15:0] sum1 , sum2, sum3, sum4 ;
    add16 inst1 ( a[15:0], b[15:0], 1'b0 , sum1 , cout1 ) ;
    add16 inst2 ( a[31:16], b[31:16], 1'b0 , sum2 ,cout2 ) ;
    add16 inst3 ( a[31:16], b[31:16], 1'b1 , sum3 ,cout3 ) ;
    always @ ( * ) begin
        case ( cout1 ) 
            0 : sum4 = sum2 ;
            1 : sum4 = sum3 ;
        endcase
    end
    assign sum = { sum4,sum1 } ;
    
    
endmodule
