module tb_decoder_2to4;
    reg [1:0] A;
    wire [3:0] Y;

    decoder_2to4 uut (
        .A(A),
        .Y(Y)
    );

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0, tb_decoder_2to4);
     
    end
  
  initial begin
      
      $display("%b  %b | %b  %b  %b  %b", A[1], A[0], Y[3], Y[2], Y[1], Y[0]);
      
        A = 2'b00; #10;
        $display("%b  %b | %b  %b  %b  %b", A[1], A[0], Y[3], Y[2], Y[1], Y[0]);

        A = 2'b01; #10;
        $display("%b  %b | %b  %b  %b  %b", A[1], A[0], Y[3], Y[2], Y[1], Y[0]);

        A = 2'b10; #10;
        $display("%b  %b | %b  %b  %b  %b", A[1], A[0], Y[3], Y[2], Y[1], Y[0]);

        A = 2'b11; #10;
        $display("%b  %b | %b  %b  %b  %b", A[1], A[0], Y[3], Y[2], Y[1], Y[0]);

        $finish;
    end
endmodule
