module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter START = 0, DATA = 1, STOP = 2, WAIT = 3 ;
    reg [2:0] state, next_state;
    reg [3:0] count ;
    always @ ( posedge clk ) begin
        if ( reset ) begin
            state <= START ;
        end
    else begin
        state <= next_state ;
    end
    end
    always @ ( * ) begin
        case (state ) 
            START : next_state = in ? START : DATA ;
            DATA : next_state = count<=4'd7 ? DATA : ( in ? STOP : WAIT )  ;
            STOP : next_state = in ? START : DATA ;
            WAIT : next_state = in ? START : WAIT ;
            default : next_state = START ;
        endcase
    end
        always @ ( posedge clk ) begin
            if ( reset) 
                count <= 4'd0 ;
            else if ( state == DATA ) 
                count <= count + 1'd1 ;
            else 
                count <= 0 ;
        end
     assign done = state == STOP ;       

endmodule
