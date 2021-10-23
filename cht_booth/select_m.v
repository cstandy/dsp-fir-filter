`include "mux2_1_8b.v"

module select_m(out, in, sel);
output [8:0] out;
//output reg [8:0] out;
input  [7:0] in;
input  [2:0] sel;

// wire         inv = sel[2];
// wire   [1:0] _shift = sel[1:0];

// wire   [7:0] in_b = ~in + 1'b1;

wire _inv;
wire [1:0] _shift;
wire [7:0] in_b;

//reg _inv;
//reg [1:0] _shift;
//reg [7:0] in_b;

wire [8:0] out1;
wire [8:0] out2;
wire [8:0] out3;


// inv = 0, _shift = 10 ->  2  -> out = in << 1
// inv = 0, _shift = 01 ->  1  -> out = in
// inv = 0, _shift = 00 ->  0  -> out = 0
// inv = 1, _shift = 01 ->  -1 -> out = in_b
// inv = 1, _shift = 10 ->  -2 -> out = in_b << 1
// out is 1-bit larger to accomodate a _shift

//      _shift[1] 
//         |            inv   
// in<<1 ->| |           |
//         |A|-> out1 -> |    (~_shift[0] & ~_shift[1])
//   in  ->| |           | |           | 
//                       |C| -> out3 ->| |
// in_b  ->| |           | |           |D| -> out
//         |B| -> out2 ->|         0 ->| |
//in_b<<1->| | 
//         |
//       _shift[0] 


mux2_1_8b muxA(.out(out1), .in1({in, 1'b0}), .in2({in[7], in}), .select(_shift[1]));
mux2_1_8b muxB(.out(out2), .in1({in_b[7], in_b}), .in2({in_b, 1'b0}), .select(_shift[0]));
mux2_1_8b muxC(.out(out3), .in1(out1), .in2(out2), .select(_inv));
mux2_1_8b muxD(.out(out), .in1(out3), .in2(9'b0), .select(~_shift[0] & ~_shift[1]));

/*
always @(*) begin
	inv = sel[2];
	_shift = sel[1:0];
	in_b = ~in + 1'b1;
    if (~_shift[0] & ~_shift[1]) begin
		out = 9'b0;
    end
    else if (inv) begin
		if (_shift == 2'b01) begin
			out = {in_b[7], in_b}; //in_b
		end
		else begin
			out = {in_b, 1'b0};  //in_b << 1
		end
    end
    else begin
		if (_shift == 2'b01) begin
			out = {in[7], in}; //in
		end
		else begin
			out = {in, 1'b0};  //in << 1
		end
    end
end
*/
endmodule
