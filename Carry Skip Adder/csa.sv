module full_adder (
    input a, b, cin,
    output sum, cout
);
    assign {cout, sum} = a + b + cin;
endmodule
module carry_skip_block (
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);
    wire [3:0] p, g;
    wire [3:0] c;
    wire block_propagate;

    assign p = a ^ b;
    assign g = a & b;

    assign c[0] = cin;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & c[1]);
    assign c[3] = g[2] | (p[2] & c[2]);

    assign sum = p ^ c[3:0];

    assign block_propagate = &p;  // All bits must propagate
    assign cout = block_propagate ? cin : g[3] | (p[3] & c[3]);
endmodule
module carry_skip_adder_32bit (
    input [31:0] a,
    input [31:0] b,
    input cin,
    output [31:0] sum,
    output cout
);
    wire [7:0] c;
    assign c[0] = cin;

    carry_skip_block cs0(a[3:0],   b[3:0],   c[0], sum[3:0],   c[1]);
    carry_skip_block cs1(a[7:4],   b[7:4],   c[1], sum[7:4],   c[2]);
    carry_skip_block cs2(a[11:8],  b[11:8],  c[2], sum[11:8],  c[3]);
    carry_skip_block cs3(a[15:12], b[15:12], c[3], sum[15:12], c[4]);
    carry_skip_block cs4(a[19:16], b[19:16], c[4], sum[19:16], c[5]);
    carry_skip_block cs5(a[23:20], b[23:20], c[5], sum[23:20], c[6]);
    carry_skip_block cs6(a[27:24], b[27:24], c[6], sum[27:24], c[7]);
    carry_skip_block cs7(a[31:28], b[31:28], c[7], sum[31:28], cout);
endmodule
