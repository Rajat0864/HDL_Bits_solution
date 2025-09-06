module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
     parameter A = 0 , B = 1 , C = 2 , D = 3 , E = 4, F = 5, G = 6, H = 7, COUNT = 9, WAIT = 10 ;
    reg[3:0] state, next_state ;
    always @ ( posedge clk ) begin
        if ( reset ) begin
            state <= A ;
        end
        else begin
            state <= next_state ;
        end
    end
    always @( * ) begin
        shift_ena = 1'b0;
        case (state ) 
            A : next_state = data ? B : A ;
            B : next_state = data ? C : A ;
            C : next_state = data ? C : D ;
            D : next_state = data ? E : A ;
            E :begin next_state = F ; shift_ena = 1'b1;  end
            F :begin next_state = G ; shift_ena = 1'b1;  end
            G :begin next_state = H ; shift_ena = 1'b1;  end
            H :begin next_state = COUNT ; shift_ena = 1'b1;  end
            COUNT : next_state = done_counting ? WAIT : COUNT ;
            WAIT : next_state = ack ? A : WAIT ;
            default : next_state = A ;
        endcase
    end
    assign done = state==WAIT ;
    assign counting = state==COUNT;

endmodule

