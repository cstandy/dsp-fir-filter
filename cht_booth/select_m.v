module select_m(out, in, sel);

output reg [8:0] out;
input  [7:0] in;
input  [2:0] sel;

// wire         inv = sel[2];
// wire   [1:0] shift = sel[1:0];

// wire   [7:0] in_b = ~in + 1'b1;

reg inv;
reg [1:0] shift;
reg [7:0] in_b;

// inv = 0, shift = 10 ->  2  -> out = in << 1
// inv = 0, shift = 01 ->  1  -> out = in
// inv = 0, shift = 00 ->  0  -> out = 0
// inv = 1, shift = 01 ->  -1 -> out = in_b
// inv = 1, shift = 10 ->  -2 -> out = in_b << 1
// out is 1-bit larger to accomodate a shift

always @(*) begin
	inv = sel[2];
	shift = sel[1:0];
	in_b = ~in + 1'b1;
    if (~shift[0] & ~shift[1]) begin
		out = 9'b0;
    end
    else if (inv) begin
		if (shift == 2'b01) begin
			out = {in_b[7], in_b};
		end
		else begin
			out = {in_b, 1'b0};
		end
    end
    else begin
		if (shift == 2'b01) begin
			out = {in[7], in};
		end
		else begin
			out = {in, 1'b0};
		end
    end
end
endmodule
