`timescale 1ns / 1ps

module async_up_down_counter_tb;

reg clk;
reg reset;
reg up_down;
wire [2:0] q;

// DUT Instantiation
async_up_down_counter dut (
    .clk(clk),
    .reset(reset),
    .up_down(up_down),
    .q(q)
);

// Clock: 10ns period
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Stimulus
initial begin
    $display("Time\tReset\tUp_Down\tQ");
    $monitor("%0t\t%b\t%b\t%b", $time, reset, up_down, q);

    reset = 1;
    up_down = 1;   // Count up
    #12;

    reset = 0;
    #100;

    up_down = 0;   // Count down
    #100;

    reset = 1;
    #10;
    reset = 0;
    #50;

    $finish;
end

endmodule
