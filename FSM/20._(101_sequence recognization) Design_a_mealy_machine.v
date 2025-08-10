module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
   parameter A = 0 , B = 1 , C = 2 ;
    reg[1:0] state , next_state ;
    always @ (posedge clk or negedge aresetn ) begin
        if ( !aresetn ) begin
        state <= A ;
        end
      else begin
          state <= next_state ;
      end
    end
    always @ ( * ) begin
        case( state ) 
            A : next_state = x ? B : A ;
            B : next_state = x ? B : C ;
            C : next_state = x ? B : A ;
            default : next_state = A ;
            endcase
        end
            
            
  assign z = (state == C & x) ;    //Mealy machine (o/p fn of state and input both)...  
  
endmodule
