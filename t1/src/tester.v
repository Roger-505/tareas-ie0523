module tester_parkingController(
     output reg         vehicle_arrival
    ,output reg [ 15:0] code
    ,output reg         vehicle_left  
    ,output reg         clk
    ,output reg         rst
);
    always 
        #1 clk = ~clk;

    initial
    begin
        rst = 1;
        clk = 0;
        #10
        rst = 0;
        vehicle_arrival = 1;
        #10
        $finish;
    end 

endmodule
