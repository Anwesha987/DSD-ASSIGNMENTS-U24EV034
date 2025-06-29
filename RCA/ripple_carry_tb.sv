module ripple_carry_adder_8bit_tb;

    reg [7:0] a, b;
    reg cin;
    wire [7:0] sum;
    wire cout;

    ripple_carry_adder_8bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );
    initial begin
      $dumpfile("rca8.vcd");
      $dumpvars(0, ripple_carry_adder_8bit_tb);
	end

    initial begin
        $display("Time |     A      +     B      + Cin =     Sum     Cout");
        $display("----------------------------------------------------------");

        a = 8'b00000000; b = 8'b00000000; cin = 0;
        #10 $display("%4t | %b + %b +  %b  = %b   %b", $time, a, b, cin, sum, cout);

        a = 8'b00001111; b = 8'b00000001; cin = 0;
        #10 $display("%4t | %b + %b +  %b  = %b   %b", $time, a, b, cin, sum, cout);

        a = 8'b10101010; b = 8'b01010101; cin = 1;
        #10 $display("%4t | %b + %b +  %b  = %b   %b", $time, a, b, cin, sum, cout);

        a = 8'b11111111; b = 8'b00000001; cin = 0;
        #10 $display("%4t | %b + %b +  %b  = %b   %b", $time, a, b, cin, sum, cout);

        a = 8'b11111111; b = 8'b11111111; cin = 1;
        #10 $display("%4t | %b + %b +  %b  = %b   %b", $time, a, b, cin, sum, cout);

        $finish;
    end
endmodule
