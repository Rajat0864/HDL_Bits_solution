module top_module( 
    input  [3:0] in,
    output reg [2:0] out_both,
    output reg [3:1] out_any,
    output reg [3:0] out_different 
);
    integer i;
    always @(*) begin
        out_both = 3'b0;
        out_any = 3'b0;
        out_different = 4'b0;

        for (i = 0; i <= 3; i = i + 1) begin
            if (i <= 2) begin
                out_both[i] = in[i] & in[i+1];
                out_any[i+1] = in[i+1] | in[i];
            end
            out_different[i] = in[i] ^ in[(i+1) % 4];
        end
    end
endmodule
