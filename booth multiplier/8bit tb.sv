module tb_booth_multiplier;

    reg signed [7:0] multiplicand, multiplier;
    wire signed [15:0] product;

    booth_multiplier uut (
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product)
    );

    initial begin
        $dumpfile("booth_multiplier.vcd");
        $dumpvars(0, tb_booth_multiplier);

        $display("Time\tMultiplicand\tMultiplier\tProduct");
        $monitor("%0t\t%d\t\t%d\t\t%d", $time, multiplicand, multiplier, product);

        multiplicand = 8'd13; multiplier = 8'd3;  #10; // 13 * 3 = 39
        multiplicand = -8'd5; multiplier = 8'd4;  #10; // -5 * 4 = -20
        multiplicand = 8'd7;  multiplier = -8'd6; #10; // 7 * -6 = -42
        multiplicand = -8'd8; multiplier = -8'd2; #10; // -8 * -2 = 16
        multiplicand = 8'd127;multiplier = 8'd1;  #10; // 127 * 1 = 127
        multiplicand = 8'd0;  multiplier = -8'd5; #10; // 0 * -5 = 0

        $finish;
    end

endmodule
