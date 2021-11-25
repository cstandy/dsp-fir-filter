module cla_1b(s, cin, p, g, a, b);

	input a, b, cin;

	output s;
    output p;
    output g;

    wire p;
    wire g;
    wire and_pc;

    xor(p, a, b);
    xor(s, p, cin);
    and(and_pc, p, cin);
    and(g, a, b);
    or(cout, g, and_pc);

	// output reg s;
    // output reg p;
    // output reg g;
	
    // always @(*) begin
    //     p = a ^ b;
    // 	s = p ^ cin;
    //     g = a & b;
    // end

endmodule