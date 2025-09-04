module top_module(
    input clk,
    input load,
    input [9:0] data,
    output tc
);
    reg [9:0] count;

    always @(posedge clk) begin
        if (load) begin
            count <= data;
        end else if (count != 0) begin
            count <= count - 1;
        end
        // When count == 0 and load == 0, hold zero (no else needed)
    end

    assign tc = (count == 10'd0);

endmodule
