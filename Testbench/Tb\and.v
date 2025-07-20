module top_module ( );//
    reg [1:0] in;
    wire out ;
    andgate inst1 (in , out );
    // generate input patterns here
    initial begin
        in[1]=0;
        #20 in[1]=1 ;
   end
     initial begin
         in[0]=0;
         #10 in[0]=1 ;#10 in[0] =0; #10 in[0] = 1 ;
    end

endmodule
