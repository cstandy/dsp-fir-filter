// `include "mux2_1.v"

module mux2_1_16b(out, in1, in2, select);

input  [15:0] in1;
input  [15:0] in2;
input         select;
output [15:0] out;

// assign out = select ? in2 : in1;

mux2_1 mux0 (.out(out[ 0]), .in1(in1[ 0]), .in2(in2[ 0]), .select(select));
mux2_1 mux1 (.out(out[ 1]), .in1(in1[ 1]), .in2(in2[ 1]), .select(select));
mux2_1 mux2 (.out(out[ 2]), .in1(in1[ 2]), .in2(in2[ 2]), .select(select));
mux2_1 mux3 (.out(out[ 3]), .in1(in1[ 3]), .in2(in2[ 3]), .select(select));
mux2_1 mux4 (.out(out[ 4]), .in1(in1[ 4]), .in2(in2[ 4]), .select(select));
mux2_1 mux5 (.out(out[ 5]), .in1(in1[ 5]), .in2(in2[ 5]), .select(select));
mux2_1 mux6 (.out(out[ 6]), .in1(in1[ 6]), .in2(in2[ 6]), .select(select));
mux2_1 mux7 (.out(out[ 7]), .in1(in1[ 7]), .in2(in2[ 7]), .select(select));
mux2_1 mux8 (.out(out[ 8]), .in1(in1[ 8]), .in2(in2[ 8]), .select(select));
mux2_1 mux9 (.out(out[ 9]), .in1(in1[ 9]), .in2(in2[ 9]), .select(select));
mux2_1 mux10(.out(out[10]), .in1(in1[10]), .in2(in2[10]), .select(select));
mux2_1 mux11(.out(out[11]), .in1(in1[11]), .in2(in2[11]), .select(select));
mux2_1 mux12(.out(out[12]), .in1(in1[12]), .in2(in2[12]), .select(select));
mux2_1 mux13(.out(out[13]), .in1(in1[13]), .in2(in2[13]), .select(select));
mux2_1 mux14(.out(out[14]), .in1(in1[14]), .in2(in2[14]), .select(select));
mux2_1 mux15(.out(out[15]), .in1(in1[15]), .in2(in2[15]), .select(select));

endmodule
