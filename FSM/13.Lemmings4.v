module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging
); 
    // State encoding using parameter
    parameter LEFT = 0, RIGHT = 1, FALL_L = 2, FALL_R = 3, DIG_L = 4, DIG_R = 5, SPLAT = 6, DIED = 7;
    
    reg [2:0] state, next_state;
    reg [4:0] fall_count;

    // Next-state logic
    always @(*) begin
        case (state)
            LEFT:   next_state = (ground == 0) ? FALL_L : (dig ? DIG_L : (bump_left ? RIGHT : LEFT));
            RIGHT:  next_state = (ground == 0) ? FALL_R : (dig ? DIG_R : (bump_right ? LEFT : RIGHT));
            FALL_L: next_state =  (ground == 1 ) ? LEFT :( (fall_count == 20) ? SPLAT : FALL_L );
            FALL_R: next_state =  (ground == 1 ) ? RIGHT : ((fall_count == 20) ? SPLAT : FALL_R);
            DIG_L:  next_state = (ground == 0) ? FALL_L : DIG_L;
            DIG_R:  next_state = (ground == 0) ? FALL_R : DIG_R;
            SPLAT:  next_state = (ground == 1) ? DIED : SPLAT;
            DIED:   next_state = DIED;
            default: next_state = LEFT; 
        endcase
    end
    
    // State and fall_count flip-flops
   always @(posedge clk or posedge areset) begin
        if (areset) begin
            state <= LEFT;
            fall_count <= 0;
        end
        else begin
            state <= next_state;
            if (next_state == FALL_L || next_state == FALL_R) begin
                fall_count <= fall_count + 1;
            end
            else begin
                fall_count <= 0;
            end
        end
    end

    assign walk_left  = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = (state == FALL_L || state == FALL_R || state == SPLAT );

    assign digging    = (state == DIG_L || state == DIG_R);

endmodule
