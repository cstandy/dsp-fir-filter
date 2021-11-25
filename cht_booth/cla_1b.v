module cla_1b(s, cin, p, g, a, b);

	input a, b, cin;

	output s;
    output p;
    output g;

    wire p;
    wire g;
    wire nand_pc;
    wire nand_ab;

    xor(p, a, b);
    xor(s, p, cin);

    // Save 2 inv for bubble shifting
    nand(nand_pc, p, cin);
    nand(nand_ab, a, b);
    not(g, nand_ab);
    nand(cout, nand_ab, nand_pc);

    // and(and_pc, p, cin);
    // and(g, a, b);
    // or(cout, g, and);

	// output reg s;
    // output reg p;
    // output reg g;
	
    // always @(*) begin
    //     p = a ^ b;
    // 	s = p ^ cin;
    //     g = a & b;
    // end

endmodule