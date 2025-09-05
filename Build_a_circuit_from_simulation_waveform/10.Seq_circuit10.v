module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
  
    always @ ( * ) begin
        if ( state ) begin
            q = ~ ( a^b); 
        end
        else begin
            q = a ^ b ;
        end
    end
    
    always @(posedge clk) begin
        if (a == b ) begin
            state <= a ;
        end
        else 
            state <= state ;
    end
    
endmodule
