'timescale 1ns / 1ps

module bcd_counter (
    input wire clk,
    input wire reset,
    output reg [3:0] q
);

always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 4'b0000;
    else if (q == 4'b1001)
        q <= 4'b0000;
    else
        q <= q + 1;
end

endmodule
