module top_module (
    input clk,
    input resetn,    
    input x,
    input y,
    output f,   
    output g
); 
    parameter A = 0 , F = 1, B = 2, C = 3, D = 4, E = 5 , H = 6, G = 7, I = 8;
    reg [3:0] state , next_state ;
    always @ (posedge clk) begin
        if (!resetn) begin
            state <= A ;
        end
        else begin
            state <= next_state ;
        end
    end
    always @ (*) begin
        case (state) 
            A : next_state = resetn ?  F  : A;
            F : next_state = B;          
            B : next_state = x ? C : B ;  
            C : next_state = x ? C : D ;
            D : next_state = x ? E : B ;
            E : next_state = y ? G : H ;
            H : next_state = y ? G : I ;
            I : next_state = I ;
            G : next_state = G ;
            default : next_state = A ; 
        endcase
    end
    assign g = state== E | state == G | state == H ;
    assign f = state == F ;
endmodule
