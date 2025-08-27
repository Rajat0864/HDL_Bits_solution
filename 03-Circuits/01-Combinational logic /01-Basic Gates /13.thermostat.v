module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    assign heater = mode ? ((too_cold & (~aircon)) ? 1'b1 :1'b0)  : 1'b0 ;
    assign aircon = mode == 0 ?( (too_hot & ( ~heater ) )? 1'b1 : 1'b0 ) : 1'b0 ;
    assign fan =  ( heater | aircon ) | (~(heater & aircon ) & fan_on ) ;
                     //OR 
    // assign heater = mode & too_cold ;
    // assign aircon = ~mode & too_hot ;
    //assign fan =  heater | aircon | fan_on ;
endmodule

