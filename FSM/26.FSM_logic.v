module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    parameter [2:0] A=0,B=1,C=2,D=3,E=4;
    reg [2:0] ns;
    
    always@(*)begin
        case(y)
            A: ns = x? B:A;
            B: ns = x? E:B;
            C: ns = x? B:C;
            D: ns = x? C:B;
            E: ns = x? E:D;
            default: ns = 3'bxxx;
        endcase
    end
    
    assign z = (y==D) | (y==E);
    assign Y0 = ns[0];

endmodule
