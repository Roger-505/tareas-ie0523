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

    behavioral_parkingController
    dut
    (
        // Inputs
         .vehicle_arrival(vehicle_arrival)
        ,.code(code)
        ,.vehicle_left(vehicle_left)
        ,.clk(clk)
        ,.rst(rst)

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
    );
endmodule
