module tb_encoder8x3;

    reg  [7:0] in;
    wire [2:0] out;

    // Instantiate the encoder
    encoder8x3 uut (
        .in(in),
        .out(out)
    );

    initial begin
        $dumpfile("encoder8x3.vcd");
        $dumpvars(0, tb_encoder8x3);

        $display("Time\tInput\t\tOutput");
        $monitor("%0t\t%b\t%b", $time, in, out);

        in = 8'b00000001; #10;  // Output should be 000
        in = 8'b00000010; #10;  // Output should be 001
        in = 8'b00000100; #10;  // Output should be 010
        in = 8'b00001000; #10;  // Output should be 011
        in = 8'b00010000; #10;  // Output should be 100
        in = 8'b00100000; #10;  // Output should be 101
        in = 8'b01000000; #10;  // Output should be 110
        in = 8'b10000000; #10;  // Output should be 111

        // Test invalid input (multiple bits high)
        in = 8'b00000110; #10;  // Output should be xxx

        $finish;
    end

endmodule
