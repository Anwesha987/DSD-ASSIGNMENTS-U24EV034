module carry_lookahead_adder_8bit (
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout
);
    wire [7:0] p, g;     // propagate and generate
    wire [8:0] c;        // carry signals (c[0] to c[8])

    assign p = a ^ b;    // propagate: p[i] = a[i] XOR b[i]
    assign g = a & b;    // generate:  g[i] = a[i] AND b[i]

    assign c[0] = cin;

    // Carry Look-Ahead Logic
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
    assign c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) |
                 (p[3] & p[2] & p[1] & g[0]) |
                 (p[3] & p[2] & p[1] & p[0] & c[0]);

    assign c[5] = g[4] | (p[4] & g[3]) | (p[4] & p[3] & g[2]) |
                 (p[4] & p[3] & p[2] & g[1]) |
                 (p[4] & p[3] & p[2] & p[1] & g[0]) |
                 (p[4] & p[3] & p[2] & p[1] & p[0] & c[0]);

    assign c[6] = g[5] | (p[5] & g[4]) | (p[5] & p[4] & g[3]) |
                 (p[5] & p[4] & p[3] & g[2]) |
                 (p[5] & p[4] & p[3] & p[2] & g[1]) |
                 (p[5] & p[4] & p[3] & p[2] & p[1] & g[0]) |
                 (p[5] & p[4] & p[3] & p[2] & p[1] & p[0] & c[0]);

    assign c[7] = g[6] | (p[6] & g[5]) | (p[6] & p[5] & g[4]) |
                 (p[6] & p[5] & p[4] & g[3]) |
                 (p[6] & p[5] & p[4] & p[3] & g[2]) |
                 (p[6] & p[5] & p[4] & p[3] & p[2] & g[1]) |
                 (p[6] & p[5] & p[4] & p[3] & p[2] & p[1] & g[0]) |
                 (p[6] & p[5] & p[4] & p[3] & p[2] & p[1] & p[0] & c[0]);

    assign c[8] = g[7] | (p[7] & g[6]) | (p[7] & p[6] & g[5]) |
                 (p[7] & p[6] & p[5] & g[4]) |
                 (p[7] & p[6] & p[5] & p[4] & g[3]) |
                 (p[7] & p[6] & p[5] & p[4] & p[3] & g[2]) |
                 (p[7] & p[6] & p[5] & p[4] & p[3] & p[2] & g[1]) |
                 (p[7] & p[6] & p[5] & p[4] & p[3] & p[2] & p[1] & g[0]) |
                 (p[7] & p[6] & p[5] & p[4] & p[3] & p[2] & p[1] & p[0] & c[0]);

    // Final Sum and Carry Out
    assign sum = p ^ c[7:0]; // sum[i] = p[i] XOR c[i]
    assign cout = c[8];
endmodule
