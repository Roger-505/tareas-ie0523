module tester_parkingController(
     output reg         vehicle_arrival
    ,output reg [ 15:0] code
    ,output reg         vehicle_left  
    ,output reg         clk
    ,output reg         rst
    ,output reg         code_ack
);
    always 
        #1 clk = ~clk;

    initial
    begin
        clk = 0;
        // Prueba #1 : funcionamiento normal básico
        rst             = 1;
        #10
        rst = 0;
        vehicle_arrival = 1;
        #10
        code            = 16'h5990;
        #10
        code_ack        = 1'b1;
        #10
        code_ack        = 1'b0;
        vehicle_arrival = 1'b0;
        vehicle_left    = 1'b1;
        #10
        $finish;
    end 

endmodule
