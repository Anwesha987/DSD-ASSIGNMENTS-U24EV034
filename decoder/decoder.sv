module decoder_2to4(
    input [1:0] A,      // 2-bit input
    output [3:0] Y      // 4-bit output
);

assign Y[0] = (~A[1]) & (~A[0]);
assign Y[1] = (~A[1]) & ( A[0]);
assign Y[2] = ( A[1]) & (~A[0]);
assign Y[3] = ( A[1]) & ( A[0]);

endmodule
