module full_adder_behavioral (
    input wire a,
    input wire b,
    input wire cin,
    output reg sum,
    output reg cout
);
    always @(*) begin
        {cout, sum} = a + b + cin;
    end
endmodule
