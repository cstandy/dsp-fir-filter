module cla_1b(s, cin, p, g, a, b);

	input a, b, cin;

	output s;
    output p;
    output g;

    wire p;
    wire g;

    xor(p, a, b);
    xor(s, p, cin);
    and(g, a, b);

	// output reg s;
    // output reg p;
    // output reg g;
	
    // always @(*) begin
    //     p = a ^ b;
    // 	s = p ^ cin;
    //     g = a & b;
    // end

endmodule