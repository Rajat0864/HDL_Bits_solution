module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    wire [100:0] carry;
    assign carry[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : bcd_digit
            wire [4:0] raw_sum;
            wire [4:0] corrected_sum;
            wire       correction;

            assign raw_sum = a[4*i +: 4] + b[4*i +: 4] + carry[i];
            assign correction = (raw_sum > 5'd9);
            assign corrected_sum = raw_sum + (correction ? 5'd6 : 5'd0);

            assign sum[4*i +: 4] = corrected_sum[3:0];
            assign carry[i+1] = corrected_sum[4];
        end
    endgenerate

    assign cout = carry[100];

endmodule
