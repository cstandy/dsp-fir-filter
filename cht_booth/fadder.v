module fadder(s, cin, p, g, cout, a, b);

	input a, b, cin;
	output reg s;
    output reg p;
    output reg g;
    output reg cout;
	
    always @(*) begin
        p = a ^ b;
    	s = p ^ cin;
        g = a & b;
        cout = (p & cin) | g;
    end

endmodule