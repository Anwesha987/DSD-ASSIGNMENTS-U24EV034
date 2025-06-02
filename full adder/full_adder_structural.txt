module xor_gate (input a, input b, output y);
    assign y = a ^ b;
endmodule

module and_gate (input a, input b, output y);
    assign y = a & b;
endmodule

module or_gate (input a, input b, output y);
    assign y = a | b;
endmodule

module full_adder_structural (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    wire w1, w2, w3, w4, w5;

    xor_gate xor1 (a, b, w1);
    xor_gate xor2 (w1, cin, sum);

    and_gate and1 (a, b, w2);
    and_gate and2 (b, cin, w3);
    and_gate and3 (a, cin, w4);
    
    or_gate or1 (w2, w3, w5);
    or_gate or2 (w5, w4, cout);
endmodule
