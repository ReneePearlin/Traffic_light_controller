
module tb_traffic_light_controller;

    logic clk, reset;
    logic [2:0] lights;

    // Instantiate the module
    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .lights(lights)
    );

    // Clock Generation
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        $monitor("Time=%0t | Lights=%b", $time, lights);
        clk = 0; reset = 1;  // Initial reset
        #10 reset = 0;       // Release reset
        #100 $finish;        // End simulation after some time
    end

endmodule
