//lemmings 2
module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah
); 

    // State encoding using parameter
    parameter LEFT   = 2'd0;
    parameter RIGHT  = 2'd1;
    parameter FALL_L = 2'd2;
    parameter FALL_R = 2'd3;

    reg [1:0] state, next_state;

    // Next-state logic
    always @(*) begin
        case (state)
            LEFT:   next_state = (ground == 0) ? FALL_L : (bump_left ? RIGHT : LEFT);
            RIGHT:  next_state = (ground == 0) ? FALL_R : (bump_right ? LEFT : RIGHT);
            FALL_L: next_state = (ground == 1) ? LEFT : FALL_L;
            FALL_R: next_state = (ground == 1) ? RIGHT : FALL_R;
            default: next_state = LEFT;
        endcase
    end

    // State flip-flop
    always @(posedge clk or posedge areset) begin
        if (areset)
            state <= LEFT;
        else
            state <= next_state;
    end

    // Output logic
    assign walk_left  = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah       = (state == FALL_L || state == FALL_R);

endmodule
