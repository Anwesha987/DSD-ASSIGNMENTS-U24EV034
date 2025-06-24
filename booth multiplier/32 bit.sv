module booth_multiplier_32 (
    input  signed [31:0] multiplicand,
    input  signed [31:0] multiplier,
    output signed [63:0] product
);

    reg signed [63:0] A, S, P;
    integer i;

    always @(*) begin
        A = {multiplicand, 32'b0};            // A = M << 32
        S = {-multiplicand, 32'b0};           // S = -M << 32
        P = {32'b0, multiplier, 1'b0};        // P = {0, Q, Q-1}

        for (i = 0; i < 32; i = i + 1) begin
            case (P[1:0])
                2'b01: P = P + A;
                2'b10: P = P + S;
                default: ; // No operation
            endcase
            P = P >>> 1; // Arithmetic right shift
        end
    end
  assign product = P[63:0];
endmodule
