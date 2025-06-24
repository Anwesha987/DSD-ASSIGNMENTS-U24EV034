module mux16x1 (
    input  [15:0] in,      // 16 input lines
    input  [3:0]  sel,     // 4-bit select line
    output        out     // 1 output
);
    assign out = in[sel];
endmodule
