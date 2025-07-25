module top_module ();
    reg clk, reset, t;
    wire q;

    // Instantiate the T Flip-Flop module
    tff inst1 (.clk(clk), .reset(reset), .t(t), .q(q));  

    // Clock generation: toggles every 5 time units
    initial begin
        clk = 0;             // Always initialize clk
        forever #5 clk = ~clk;
    end

    // Stimulus block
    initial begin
        t = 0;
        reset = 1;
        
        #2  t = 1; reset = 0;
        #10 t = 0; reset = 0;
        #15 t = 1; reset = 1;
        #20 t = 1; reset = 0;   // FIXED: Verilog does not support t = 2 for a 1-bit t
    end

endmodule
