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
        rst             = 1'b1;
        vehicle_arrival = 1'b0;
        code            = 16'h0;
        code_ack        = 1'b0; 
        vehicle_left    = 1'b1; 
        #50
        rst             = 1'b0;
        vehicle_arrival = 1'b1;
        vehicle_left    = 1'b0;
        code            = 16'h5990;
        #50
        code_ack        = 1'b1;
        #50
        code            = 16'h0;
        code_ack        = 1'b0;
        vehicle_arrival = 1'b0;
        vehicle_left    = 1'b1;
        #50
        // Prueba #2 : ingreso de pin incorrecto menos de 3 veces
        $finish;
    end 

endmodule
