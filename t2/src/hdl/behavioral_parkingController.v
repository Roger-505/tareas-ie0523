`include "state_defs.vh"

module behavioral_parkingController
(
    // Inputs
     input              vehicle_arrival
    ,input      [ 15:0] code
    ,input              vehicle_left  
    ,input              clk
    ,input              rst
    ,input              code_ack
    ,input              gate_ack

    // Outputs
    ,output reg         open_gate
    ,output reg         wrong_ping
    ,output reg         close_gate
    ,output reg         blocked_gate
);
    // State regs
    reg [  5:0] state;
    reg [  5:0] next_state;
    
    // Internal regs
    reg [  1:0] attempt;
    reg [  1:0] next_attempt;
  
    // Parameters
    localparam correct_code = 16'h5990;

    // Sequential logic
    always @(posedge clk) begin
        if (rst) 
        begin
            state      <= `NO_VEHICLE;
            attempt    <= 2'b0;
        end 
        else    // FF transition
        begin
            attempt <= next_attempt;
            state   <= next_state;
        end
    end

    always @(*)
    begin
        // Default values
        next_attempt    = attempt;
        next_state      = state;
        open_gate       = 1'b0;
        wrong_ping      = 1'b0;
        close_gate      = 1'b0;
        blocked_gate    = 1'b0;

        // Next-state logic
        case (state)
            `NO_VEHICLE: 
            begin
                if (vehicle_arrival)
                    next_state = `WAIT_FOR_PIN;
            end
            `WAIT_FOR_PIN: 
            begin
                if (code_ack) 
                begin
                    next_state = (code == correct_code) ? `CORRECT_PIN : `INCORRECT_PIN; 
                end

                // reset if vehicle stops attempting to enter
                if (vehicle_left) 
                begin
                    next_state  = `DEFAULT; 
                end
            end
            `INCORRECT_PIN: 
            begin
                if (!code_ack) begin 
                        next_attempt    = attempt + 2'b01;
                        if (attempt != 2'b11)
                            next_state = `WAIT_FOR_PIN;
                        else
                            next_state = `BLOCKED;
                end
            end 
            `CORRECT_PIN: 
            begin
                open_gate       = 1'b1;
                next_attempt    = 2'b0;

                if (vehicle_left)
                begin
                    next_state = (vehicle_arrival) ? `BLOCKED : `WAIT_TO_CLOSE;
                end
            end
            `WAIT_TO_CLOSE: 
             begin
                open_gate   = 1'b0;
                close_gate  = 1'b1;
                
                if (gate_ack)
                    next_state  = `NO_VEHICLE; 
             end
            `BLOCKED:
             begin
                 // Alarms
                 if (attempt == 2'b11) 
                    wrong_ping   = 1'b1;
                else 
                    blocked_gate = 1'b1; 
             end
            default:    // Reset
            begin
                next_state      = `NO_VEHICLE;
                next_attempt    = 2'b0;
                open_gate       = 1'b0;
                wrong_ping      = 1'b0;
                close_gate      = 1'b0;
                blocked_gate    = 1'b0;
            end
        endcase
    end 
endmodule

