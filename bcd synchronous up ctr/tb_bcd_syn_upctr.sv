`timescale 1ns / 1ps

module bcd_counter_tb;

reg clk;
reg reset;
wire [3:0] q;

// Instantiate the Design Under Test (DUT)
bcd_counter dut (
    .clk(clk),
    .reset(reset),
    .q(q)
);

// Clock generation: 10ns period (100 MHz)
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Simulation stimulus
initial begin
    // Optional: print output to console
    $display("Time\tReset\tQ");
    $monitor("%0t\t%b\t%0d", $time, reset, q);

    // Reset the counter
    reset = 1;
    #12;
    reset = 0;

    // Let the counter run for a while
    #100;

    // Apply another reset mid-way
    reset = 1;
    #10;
    reset = 0;

    // Continue simulation for a bit more
    #50;

    $finish;
end

endmodule
