module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg [7:0] out_byte,
    output done
);
    parameter START = 0, DATA = 1, STOP = 2, WAIT = 3, PARITY = 4, STOP_CHECK = 5;
    reg [3:0] state, next_state;
    reg [3:0] count;
    reg parity_bit;

    // State transition FSM
    always @(posedge clk) begin
        if (reset)
            state <= START;
        else
            state <= next_state;
    end

    always @(*) begin
        case(state)
            START:       next_state = (in) ? START : DATA;
            DATA:        next_state = (count < 4'd7) ? DATA : PARITY;
            PARITY:      next_state = (^({out_byte, in})) ? STOP_CHECK : WAIT; // Even parity
            STOP_CHECK:  next_state = (in) ? STOP : WAIT;
            STOP:        next_state = (in) ? START : DATA;
            WAIT:        next_state = (in) ? START : WAIT;
            default:     next_state = START;
        endcase
    end

    // Data and control path
    always @(posedge clk) begin
        if (reset) begin
            count <= 4'd0;
            out_byte <= 8'd0;
        end else if (state == DATA) begin
            out_byte <= {in, out_byte[7:1]};          // Shift in bit, MSB first
            count <= count + 1'd1;
        end else begin
            count <= 4'd0;                            // Reset counter outside DATA
        end
    end

    assign done = (state == STOP);

endmodule
