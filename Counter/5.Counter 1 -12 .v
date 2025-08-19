module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
);

    // Instantiate the provided 4-bit counter
    count4 the_counter (
        .clk(clk),
        .enable(c_enable),
        .load(c_load),
        .d(c_d),
        .Q(Q)
    );

    // Control signals
    assign c_enable = enable;                        
    assign c_load   = reset | (enable && Q == 4'd12); 
    assign c_d      = 4'd1;                         

endmodule
