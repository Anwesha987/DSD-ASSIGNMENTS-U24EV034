module full_adder (
    input a, b, cin,
    output sum, cout
);
    assign {cout, sum} = a + b + cin;
endmodule
module ripple_carry_adder_8bit (
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout
);
    wire [6:0] carry;

    full_adder FA0 (a[0], b[0], cin,        sum[0], carry[0]);
    full_adder FA1 (a[1], b[1], carry[0],   sum[1], carry[1]);
    full_adder FA2 (a[2], b[2], carry[1],   sum[2], carry[2]);
    full_adder FA3 (a[3], b[3], carry[2],   sum[3], carry[3]);
    full_adder FA4 (a[4], b[4], carry[3],   sum[4], carry[4]);
    full_adder FA5 (a[5], b[5], carry[4],   sum[5], carry[5]);
    full_adder FA6 (a[6], b[6], carry[5],   sum[6], carry[6]);
    full_adder FA7 (a[7], b[7], carry[6],   sum[7], cout);
endmodule
