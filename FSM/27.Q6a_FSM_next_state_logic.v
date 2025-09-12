module top_module (
    input [3:1] y,
    input w,
    output Y2);
    parameter A = 0, B = 1, C = 2, D = 3, E = 4, F = 5;
    reg [2:0] next_state;  // Keep original [3:1]
    always @ ( * ) begin
        case ( y ) 
            A : next_state = w ? A : B ;
            B : next_state = w ? D : C ;
            C : next_state = w ? D : E ;
            D : next_state = w ? F : A ;
            E : next_state = w ? D : E ;
            F : next_state = w ? D : C ;
            default : next_state = A ;
        endcase
    end
    assign Y2 = next_state[1]; 
endmodule
