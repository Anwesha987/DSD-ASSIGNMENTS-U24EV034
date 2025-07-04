`timescale 1ns / 1ps

module async_up_down_counter (
    input wire clk,
    input wire reset,
    input wire up_down,      // 1 for up, 0 for down
    output reg [2:0] q
);

// On reset, set output to 0
always @(negedge clk or posedge reset) begin
    if (reset)
        q[0] <= 0;
    else
        q[0] <= q[0] ^ 1;     // Toggle LSB
end

always @(negedge q[0] or posedge reset) begin
    if (reset)
        q[1] <= 0;
    else if (up_down)
        q[1] <= q[1] ^ 1;     // Toggle on LSB falling edge for up
    else
        q[1] <= ~q[1];        // Invert for down
end

always @(negedge q[1] or posedge reset) begin
    if (reset)
        q[2] <= 0;
    else if (up_down)
        q[2] <= q[2] ^ 1;     // Toggle for up
    else
        q[2] <= ~q[2];        // Invert for down
end

endmodule
