`include "mux2_1_9b.v"

module select_m(out, in, sel);

// inv = 0, _shift = 10 ->  2  -> out = in << 1
// inv = 0, _shift = 01 ->  1  -> out = in
// inv = 0, _shift = 00 ->  0  -> out = 0
// inv = 1, _shift = 01 ->  -1 -> out = in_b
// inv = 1, _shift = 10 ->  -2 -> out = in_b << 1
// out is 1-bit larger to accomodate a _shift

//        shift[0] 
//           |            inv   
//  in<<1  ->| |           |
//           |A|-> out1 -> |    (~shift[0] & ~shift[1])
//    in   ->| |           | |           | 
//                         |C| -> out3 ->| |
// in_b<<1 ->| |           | |           |D| -> out
//           |B| -> out2 ->|         0 ->| |
//  in_b   ->| | 
//           |
//         shift[0] 

/* ------------------------ Hierarchy gate level -----------------------------*/

// output [8:0] out;
// input  [7:0] in;
// input  [2:0] sel;

// wire         _inv   = sel[2];
// wire   [1:0] _shift = sel[1:0];
// wire   [7:0] in_b   = ~in + 1'b1;

// wire [8:0] out1;
// wire [8:0] out2;
// wire [8:0] out3;

// mux2_1_9b muxA(.out(out1), .in1({in, 1'b0}  ), .in2({in[7], in}    ), .select(_shift[0]));
// mux2_1_9b muxB(.out(out2), .in1({in_b, 1'b0}), .in2({in_b[7], in_b}), .select(_shift[0]));
// mux2_1_9b muxC(.out(out3), .in1(out1        ), .in2(out2           ), .select(_inv));
// mux2_1_9b muxD(.out(out),  .in1(out3        ), .in2(9'b0           ), .select(~_shift[0] & ~_shift[1]));

/* --------------------------- Behavior level --------------------------------*/

output [9:0] out;

input  [7:0] in;
input  [2:0] sel;

reg out;
reg inv;
reg [1:0] shift;

reg [8:0] in_b;
reg [8:0] _in;

// _in is a sign extention of input in.
// 
// The reason we need a sign extension here is for the corner case. In
// particular, -128 (8'b1000_0000) as the input. The whole picture is an
//
//         8-bit x 8-bit -> 16-bit
// 
// multiplier. When the multiplicand is -128, we need to distinguish it from
// its 2's complement (also 8'b01000_0000 in 8-bit expression). For example,
// -128 x -128 in 8-bit scheme will cause an error for final sign extension.
// 
//               10000000
//             x 10000000.0
//      -------------------
//             000000000    [000] -> 0 -> 0
//           000000000      [000] -> 0 -> 0
//         000000000        [000] -> 0 -> 0
//     + 100000000          [100] -> -2 -> in_b << 1, in_b = ~in + 1 (all 8-bit)
//     --------------------
//       100000000000000
//       
//    => 100_0000_0000_0000 -------------> 1100_0000_0000_0000 (-16384)
//                           sign extend
// 
// However, in the 16-bit output, we should be able to represent the correct
// output 16384 (16'b0100_0000_0000_0000). The reason why the sign extension
// fails is that it cannot distinguish -128 from its 2's complement. The
// solution could be sign extension one bit here, so that
//
//   -128 = 9'b1_1000_0000
//    128 = 9'b0_1000_0000
//
// and the above example can be revised as
// 
//              110000000
//            x 110000000.0
//      -------------------
//            0000000000    [000] -> 0 -> 0
//          0000000000      [000] -> 0 -> 0
//        0000000000        [000] -> 0 -> 0
//    + 0100000000          [100] -> -2 -> in_b << 1, in_b = ~in + 1 (all 9-bit)
//     --------------------
//      0100000000000000
//       
//    => 0100_0000_0000_0000 no sign extension required

always @(*) begin
	_in   = {in[7], in};
	inv   = sel[2];
	shift = sel[1:0];
	in_b  = ~_in + 1'b1;
    if (~shift[0] & ~shift[1]) begin
		out = 10'b0;
    end
    else if (inv) begin
		if (shift == 2'b01) begin
			out = {in_b[8], in_b}; // in_b
		end
		else begin
			out = {in_b, 1'b0};    // in_b << 1
		end
    end
    else begin
		if (shift == 2'b01) begin
			out = {_in[8], _in}; // in
		end
		else begin
			out = {_in, 1'b0};  // in << 1
		end
    end
end

endmodule
