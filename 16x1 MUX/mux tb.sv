module tb_mux16x1;
    reg  [15:0] in;
    reg  [3:0]  sel;
    wire        out;

    // Instantiate the mux
    mux16x1 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );
    initial begin
        $dumpfile("mux16x1.vcd");    
        $dumpvars(0, tb_mux16x1); 
    end  

    initial begin
        $display("Time\t\tSelect\t\tOutput");
        $monitor("%0t\t\t%b\t\t%b", $time, sel, out);

        // Apply test cases
        in = 16'b0000_0000_0000_0001; sel = 4'd0; #10;  // out should be 1
        in = 16'b0000_0000_0000_0010; sel = 4'd1; #10;  // out should be 1
        in = 16'b0000_0000_0000_0100; sel = 4'd2; #10;
        in = 16'b0000_0000_0000_1000; sel = 4'd3; #10;
        in = 16'b0000_0000_0001_0000; sel = 4'd4; #10;
        in = 16'b0000_0000_0010_0000; sel = 4'd5; #10;
        in = 16'b0000_0000_0100_0000; sel = 4'd6; #10;
        in = 16'b0000_0000_1000_0000; sel = 4'd7; #10;
        in = 16'b0000_0001_0000_0000; sel = 4'd8; #10;
        in = 16'b0000_0010_0000_0000; sel = 4'd9; #10;
        in = 16'b0000_0100_0000_0000; sel = 4'd10; #10;
        in = 16'b0000_1000_0000_0000; sel = 4'd11; #10;
        in = 16'b0001_0000_0000_0000; sel = 4'd12; #10;
        in = 16'b0010_0000_0000_0000; sel = 4'd13; #10;
        in = 16'b0100_0000_0000_0000; sel = 4'd14; #10;
        in = 16'b1000_0000_0000_0000; sel = 4'd15; #10;

        $finish;
    end
endmodule
