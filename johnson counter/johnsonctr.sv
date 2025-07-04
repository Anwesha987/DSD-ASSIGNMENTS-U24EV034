`timescale 1ns / 1ps

module johnson_counter (
    input wire clk,
    input wire reset,
    output reg [3:0] q
);

always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 4'b0000;
    else
        q <= {~q[3], q[3:1]}; // Shift right, insert inverted MSB at LSB
end

endmodule
