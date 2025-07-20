//lemmings 1
module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    // parameter LEFT=0, RIGHT=1, ...
    reg state, next_state;
    parameter LEFT = 0 ,RIGHT =1;

    always @(*) begin
        // State transition logic
        case(state)
            LEFT:next_state = bump_left ? RIGHT:LEFT;
             RIGHT:next_state = bump_right ? LEFT:RIGHT;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset) begin
            state <=LEFT;
            
        end
        else begin
            state <= next_state;
        end
    end

    // Output logic
    assign walk_right = (state ==RIGHT);
    assign walk_left = (state == LEFT);

endmodule
