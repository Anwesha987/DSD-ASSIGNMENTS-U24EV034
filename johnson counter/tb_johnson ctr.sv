`timescale 1ns / 1ps

module johnson_counter_tb;

reg clk;
reg reset;
wire [3:0] q;

johnson_counter dut (
    .clk(clk),
    .reset(reset),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $display("Time\tReset\tQ");
    $monitor("%0t\t%b\t%b", $time, reset, q);

    reset = 1;
    #10;
    reset = 0;

    #120;

    $finish;
end

endmodule
