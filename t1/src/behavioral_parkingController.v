`include "state_defs.vh"

module behavioral_parkingController
(
    // Inputs
     input          vehicle_arrival
    ,input  [ 15:0] code
    ,input          vehicle_left  
    ,input          clk
    ,input          rst

    // Outputs
    ,output         open_gate
    ,output         wrong_ping
    ,output         close_gate
    ,output         blocked_gate
);
    // State regs
    reg     [  5:0] state;
    reg     [  5:0] next_state;
    
    // Internal regs
    reg     [  1:0] ATTEMPT;
    
endmodule
