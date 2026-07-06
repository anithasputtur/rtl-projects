// Testbench for Traffic Light Controller
// File: testbench.v

module tb_traffic_light;

reg  clk, rst, emergency;
wire [1:0] light;

// Instantiate the design
traffic_light uut (
    .clk(clk),
    .rst(rst),
    .emergency(emergency),
    .light(light)
);

// Clock: toggles every 5ns
initial clk = 0;
always #5 clk = ~clk;

initial begin
    // Reset
    rst = 1; emergency = 0;
    #10 rst = 0;

    // Normal cycle
    #100;

    // Trigger emergency
    emergency = 1;
    #20;
    emergency = 0;

    // Resume normal
    #100;

    $stop;
end

// Monitor output
initial begin
    $monitor("Time=%0t | rst=%b | emergency=%b | light=%b",
              $time, rst, emergency, light);
end

endmodule