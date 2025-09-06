module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    reg[2:0] count ;
    
    always @ (posedge clk ) begin
        if ( reset ) begin
            shift_ena <= 1'b1 ;
            count <= 0 ;
        end
        else
            count <= count + 1'b1 ;
        if (count == 3 ) begin
            shift_ena <= 1'b0;
        end
    end
    
endmodule
