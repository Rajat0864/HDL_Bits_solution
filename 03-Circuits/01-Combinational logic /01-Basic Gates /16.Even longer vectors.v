module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
    integer i;
    always @(*) begin
        out_both = 3'b0;
        out_any = 3'b0;
        out_different = 4'b0;

        for (i = 0; i <= 99; i = i + 1) begin
            if (i <= 98) begin
                out_both[i] = in[i] & in[i+1];
                out_any[i+1] = in[i+1] | in[i];
            end
            out_different[i] = in[i] ^ in[(i+1) % 100];
        end
    end
endmodule
