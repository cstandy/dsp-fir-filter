module cla_1b(s, cin, p, g, a, b);

	input a, b, cin;
	output reg s;
    output reg p;
    output reg g;
	
    always @(*) begin
        p = a ^ b;
    	s = p ^ cin;
        g = a & b;
    end

endmodule