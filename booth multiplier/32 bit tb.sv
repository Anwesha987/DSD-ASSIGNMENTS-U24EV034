module tb_booth_multiplier_32;

    reg signed [31:0] multiplicand, multiplier;
    wire signed [63:0] product;

    booth_multiplier_32 uut (
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product)
    );

    initial begin
        $dumpfile("booth_multiplier_32.vcd");
        $dumpvars(0, tb_booth_multiplier_32);

        $display("Time\tMultiplicand\tMultiplier\tProduct");
        $monitor("%0t\t%d\t\t%d\t\t%d", $time, multiplicand, multiplier, product);

        // Test cases
        multiplicand = 32'd15;     multiplier = 32'd10;     #10; // 150
        multiplicand = -32'd25;    multiplier = 32'd3;      #10; // -75
        multiplicand = 32'd1000;   multiplier = -32'd2000;  #10; // -2,000,000
        multiplicand = -32'd50000; multiplier = -32'd1000;  #10; // 50,000,000
        multiplicand = 32'd0;      multiplier = 32'd12345;  #10; // 0
        multiplicand = -32'd1;     multiplier = 32'd2147483647; #10; // -2147483647

        $finish;
    end

endmodule
