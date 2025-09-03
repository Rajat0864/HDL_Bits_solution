module top_module (
    input clk,
    input reset,          // synchronous active-high reset
    output [3:1] ena,     // enable signals for digits 1...3
    output [15:0] q       // all four BCD digits: {thousands, hundreds, tens, ones}
);
    wire [3:0] q0, q1, q2, q3;

    bcd_digit ones     (clk, reset,  1'b1, q0);
    bcd_digit tens     (clk, reset, ena[1],q1);
    bcd_digit hundreds (clk, reset, ena[2],q2);
    bcd_digit thousands(clk, reset, ena[3],q3);

      assign ena[1] = (q0 == 4'd9);
    assign ena[2] = (q0 == 4'd9) && (q1 == 4'd9);
    assign ena[3] = (q0 == 4'd9) && (q1 == 4'd9) && (q2 == 4'd9);

    assign q = {q3, q2, q1, q0};
endmodule

module bcd_digit (
    input clk,
    input reset,    
    input ena,
    output reg [3:0] q
);
    always @(posedge clk) begin
        if (reset)
            q <= 4'd0;
        else if (ena) begin
            if (q == 4'd9)
                q <= 4'd0;
            else
                q <= q + 4'd1;
        end
    end
endmodule
