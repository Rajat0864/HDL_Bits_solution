module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    reg [1:0] count;

    always @(posedge clk or posedge areset) begin
        if (areset) begin
            count <= 2'b01;  
        end else if (train_valid & train_taken) begin
            if (count < 3)
                count <= count + 1'b1;           
        end else if (train_valid & ~train_taken) begin
            if (count > 0)
                count <= count - 1'b1; 
        end
        // else hold count
    end

    assign state = count;
endmodule
