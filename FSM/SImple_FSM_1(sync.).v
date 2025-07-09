//this code is same as previos one(asynchronous) but with a minor change inside the always block there is only positive edge of clock bcoz it is sync.
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
    parameter A=0, B=1; 

    reg present_state, next_state;

   
    always @(*) begin   // This is a combinational always block
        case(present_state)// State transition logic
            A:next_state=in?A:B;
            B:next_state=in?B:A;
        endcase
    end

    always @(posedge clk) begin 
        if(reset)begin  // This is a sequential always block
            present_state<=B;
        end
        else begin
            present_state<=next_state;
            
        end
           
        
    end

    // Output logic
    assign out = (present_state == B);

endmodule
