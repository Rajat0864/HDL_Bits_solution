module top_module (
    input clk,
    input resetn,  
    input [3:1] r,   
    output reg [3:1] g   
); 
    parameter A = 0, B = 1, C = 2, D = 3;
    reg [1:0] state, next_state;  

    always @(posedge clk) begin
        if (!resetn)
            state <= A;
        else if (r == 0)
            state <= A;
        else
            state <= next_state;
    end

    always @(*) begin
        g = 3'b000;   
        case (state)
            A: next_state = r[1] ? B : r[2] ? C : r[3] ? D : A;
            B: begin
                next_state = r[1] ? B : A;
                g[1] = 1;
            end
            C: begin
                next_state = r[2] ? C : A;
                g[2] = 1;
            end
            D: begin
                next_state = r[3] ? D : A;
                g[3] = 1;
            end
            default: next_state = A;
        endcase
    end

endmodule
