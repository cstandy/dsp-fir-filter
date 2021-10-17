module booth_encoder(inv, shift, in);

output reg       inv;
output reg [1:0] shift; // The shift amount

input  [2:0] in;

wire a = in[2];
wire b = in[1];
wire c = in[0];
reg high;
reg low;

always @(in) begin
	inv = a & (~b | ~c);
	high = (~a & b & c) | (a & ~b & ~c);
	low = (~b & c) | (b & ~c);
	shift = {high, low};
end

endmodule
