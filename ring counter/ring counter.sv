`timescale 1ns / 1ps

module ring_counter (
    input wire clk,
    input wire reset,
    output reg [3:0] q
);

always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 4'b0001; // Start with '1' in LSB
    else
        q <= {q[2:0], q[3]}; // Shift left, wrap MSB to LSB
end

endmodule
