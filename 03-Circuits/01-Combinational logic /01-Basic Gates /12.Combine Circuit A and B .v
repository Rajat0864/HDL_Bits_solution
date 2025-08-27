module top_module (input x, input y, output z);
    wire z1 ,z2, z3, z4 ,y1 ,y2 ;
       A IA1( x , y , z1 ) ;
       B IB1( x , y , z2 ) ;
       A IA2( x , y , z3 ) ;
       B IB2( x , y , z4 ) ;
    assign y1 = z1 | z2 ;
    assign y2 = z3 & z2 ;
    assign z = y1 ^ y2 ;
    

endmodule

module A (input x, input y, output z);
    assign z = x & (~y) ;

endmodule
module B ( input x, input y, output z );
    assign z = ~ ( x ^ y ) ;
endmodule
