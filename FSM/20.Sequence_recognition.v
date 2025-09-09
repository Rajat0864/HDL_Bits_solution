module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err
);
    
    parameter S1 = 0 ,S2 = 1, S3 = 2 ,S4 = 3 ,S5 = 4 ,S6 = 5 ,DISC = 6, S7 = 7, ERROR = 8, FLAG = 9;  
    
    reg [4:0] state, next_state;
    
    always @(posedge clk) begin
        if (reset) begin
            state <= S1;
        end
        else begin
            state <= next_state;
        end
    end
    
    always @(*) begin
        case (state) 
            S1    : next_state = in ? S2 : S1;
            S2    : next_state = in ? S3 : S1;
            S3    : next_state = in ? S4 : S1;
            S4    : next_state = in ? S5 : S1;
            S5    : next_state = in ? S6 : S1;
            S6    : next_state = in ? S7 : DISC;
            DISC  : next_state = in ? S2 : S1;
            S7    : next_state = in ? ERROR : FLAG;
            ERROR : next_state = in ? ERROR : S1;
            FLAG  : next_state = in ? S2 : S1;
            default : next_state = S1;
        endcase
    end
    
    assign disc = (state == DISC);
    assign flag = (state == FLAG);
    assign err  = (state == ERROR);
    
endmodule
