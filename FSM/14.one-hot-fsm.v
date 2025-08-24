module top_module(
    input        in,
    input  [9:0] state,
    output reg [9:0] next_state,
    output reg       out1,
    output reg       out2
);

    always @(*) begin
        next_state = 10'b0;
        out1 = 0;
        out2 = 0;

        // State 0
        if (state[0]) begin
            if (in)    next_state[1] = 1;
            else       next_state[0] = 1;
        end

        // State 1
        if (state[1]) begin
            if (in)    next_state[2] = 1;
            else       next_state[0] = 1;
        end

        // State 2
        if (state[2]) begin
            if (in)    next_state[3] = 1;
            else       next_state[0] = 1;
        end

        // State 3
        if (state[3]) begin
            if (in)    next_state[4] = 1;
            else       next_state[0] = 1;
        end

        // State 4
        if (state[4]) begin
            if (in)    next_state[5] = 1;
            else       next_state[0] = 1;
        end

        // State 5
        if (state[5]) begin
            if (in)    next_state[6] = 1;
            else       next_state[8] = 1;
        end

        // State 6
        if (state[6]) begin
            if (in)    next_state[7] = 1;
            else       next_state[9] = 1;
        end

        // State 7
        if (state[7]) begin
            if (in)    next_state[7] = 1;      // stays in S7
            else       next_state[0] = 1;

            out2 = 1;
        end

        // State 8
        if (state[8]) begin
            if (in)    next_state[1] = 1;
            else       next_state[0] = 1;

            out1 = 1;
        end

        // State 9
        if (state[9]) begin
            if (in)    next_state[1] = 1;
            else       next_state[0] = 1;

            out1 = 1;
            out2 = 1;
        end
    end

endmodule
