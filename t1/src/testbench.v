module tb;
    wire            vehicle_arrival;
    wire    [ 15:0] code;
    wire            vehicle_left;
    wire            clk;
    wire            rst;

    wire            open_gate;
    wire            wrong_ping;
    wire            close_gate;
    wire            blocked_gate;
    wire            code_ack;
    wire            gate_acK;

    initial 
    begin
        $dumpfile("sim.vcd");
        $dumpvars(-1, dut);
    end
    // carnet = C15990    
    behavioral_parkingController #(16'h5990)
    dut
    (
        // Inputs
         .vehicle_arrival(vehicle_arrival)
        ,.code(code)
        ,.vehicle_left(vehicle_left)
        ,.clk(clk)
        ,.rst(rst)
        ,.code_ack(code_ack)
        ,.gate_ack(gate_ack)

        // Outputs
        ,.open_gate(open_gate)
        ,.wrong_ping(wrong_ping)
        ,.close_gate(close_gate)
        ,.blocked_gate(blocked_gate)
    );

    tester_parkingController
    tester
    (
        // Outputs
         .vehicle_arrival(vehicle_arrival)
        ,.code(code)
        ,.vehicle_left(vehicle_left)
        ,.clk(clk)
        ,.rst(rst)
        ,.code_ack(code_ack)
        ,.gate_ack(gate_ack)
    );
endmodule
