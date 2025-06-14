module full_adder (
    input a, b, cin,
    output sum, cout
);
    assign {cout, sum} = a + b + cin;
endmodule
module ripple_carry_adder_4 (
    input [3:0] a, b,
    input cin,
    output [3:0] sum,
    output cout
);
    wire [2:0] c;

    full_adder fa0(a[0], b[0], cin,    sum[0], c[0]);
    full_adder fa1(a[1], b[1], c[0],   sum[1], c[1]);
    full_adder fa2(a[2], b[2], c[1],   sum[2], c[2]);
    full_adder fa3(a[3], b[3], c[2],   sum[3], cout);
endmodule
module carry_select_block (
    input [3:0] a, b,
    input cin,
    output [3:0] sum,
    output cout
);
    wire [3:0] sum0, sum1;
    wire cout0, cout1;

    ripple_carry_adder_4 rca0(a, b, 1'b0, sum0, cout0);
    ripple_carry_adder_4 rca1(a, b, 1'b1, sum1, cout1);

    assign sum = cin ? sum1 : sum0;
    assign cout = cin ? cout1 : cout0;
endmodulemodule carry_select_adder_32 (
    input [31:0] a, b,
    input cin,
    output [31:0] sum,
    output cout
);
    wire [7:0] carry;

    // First block uses ripple carry directly
    ripple_carry_adder_4 rca0(a[3:0],   b[3:0],   cin,     sum[3:0],   carry[0]);
    carry_select_block    cs1 (a[7:4],  b[7:4],   carry[0], sum[7:4],  carry[1]);
    carry_select_block    cs2 (a[11:8], b[11:8],  carry[1], sum[11:8], carry[2]);
    carry_select_block    cs3 (a[15:12],b[15:12], carry[2], sum[15:12],carry[3]);
    carry_select_block    cs4 (a[19:16],b[19:16], carry[3], sum[19:16],carry[4]);
    carry_select_block    cs5 (a[23:20],b[23:20], carry[4], sum[23:20],carry[5]);
    carry_select_block    cs6 (a[27:24],b[27:24], carry[5], sum[27:24],carry[6]);
    carry_select_block    cs7 (a[31:28],b[31:28], carry[6], sum[31:28],cout);
endmodule
