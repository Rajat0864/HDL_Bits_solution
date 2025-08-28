module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    reg[3:0] carry ;
    assign carry[0] = cin;
    integer i ;
    always @ ( * ) begin
        for ( i =0 ; i <= 2 ; i++ ) begin
            { carry[i+1] , sum[i] } = a[i] + b[i] + carry[i] ;
            cout[i] = carry[i+1];
        end
    end   
endmodule
