module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg [7:0] out_byte,
    output done
);
    parameter START = 0, DATA = 1, STOP = 2, WAIT = 3;
    reg [2:0] state, next_state;
    reg [3:0] count;

    // State transition logic
    always @(posedge clk) begin
        if (reset)
            state <= START;
        else
            state <= next_state;
    end
  
    always @(*) begin
        case(state)
            START: next_state = (in) ? START : DATA; 
            DATA: next_state = (count <= 4'd7) ? DATA : ((in) ? STOP : WAIT); 
            STOP: next_state = (in) ? START : DATA; 
            WAIT: next_state = (in) ? START : WAIT;
            default: next_state = START;
        endcase
    end

    always @(posedge clk) begin
        if (reset) begin
            count <= 4'd0;
            out_byte <= 8'd0; 
        end else if (state == DATA) begin
            count <= count + 1'd1;
            out_byte[count] <= in;
            
        end else begin
            count <= 4'd0;
         // hold_the out_byte value
        end
    end

    assign done = (state == STOP); 

endmodule
