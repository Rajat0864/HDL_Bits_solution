// ps2 control 
module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); 
    parameter DONE =0 , BYTE1 =1 , BYTE2 = 2 , BYTE3 = 3 ;
    reg[1:0] state , next_state;

    // State transition logic (combinational)
    always@(*) begin
        case(state) 
            BYTE1 : next_state = in[3] ? BYTE2 : BYTE1 ;
            BYTE2 : next_state = BYTE3 ;
            BYTE3 : next_state = DONE ;
            DONE : next_state = in[3] ? BYTE2 : BYTE1 ;
        endcase
    end

    // State flip-flops (sequential)
    always@(posedge clk)begin
        if (reset ) begin
            state<= BYTE1;
        end
        else begin
            state<=next_state;
        end
    end
 
    // Output logic
            assign done = state== DONE;

endmodule
