module top_module (
    input clk,
    input w, R, E, L,
    output reg Q
);
    always @(posedge clk) begin
        if (L)
            Q <= R;
        else if (~L & ~E)
            Q <= Q;
        else if (~L & E)
            Q <= w;
        else
            Q <= Q;
    end
endmodule
