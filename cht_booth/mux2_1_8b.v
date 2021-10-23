`include "mux2_1.v"
module mux2_1_8b(out, in1, in2, select);

input [8:0] in1;
input [8:0] in2;
input select;
output [8:0] out;

//assign out = select ? in2 : in1;

mux2_1 mux0(.out(out[0]), .in1(in1[0]), .in2(in2[0]), .select(select));
mux2_1 mux1(.out(out[1]), .in1(in1[1]), .in2(in2[1]), .select(select));
mux2_1 mux2(.out(out[2]), .in1(in1[2]), .in2(in2[2]), .select(select));
mux2_1 mux3(.out(out[3]), .in1(in1[3]), .in2(in2[3]), .select(select));
mux2_1 mux4(.out(out[4]), .in1(in1[4]), .in2(in2[4]), .select(select));
mux2_1 mux5(.out(out[5]), .in1(in1[5]), .in2(in2[5]), .select(select));
mux2_1 mux6(.out(out[6]), .in1(in1[6]), .in2(in2[6]), .select(select));
mux2_1 mux7(.out(out[7]), .in1(in1[7]), .in2(in2[7]), .select(select));
mux2_1 mux8(.out(out[8]), .in1(in1[8]), .in2(in2[8]), .select(select));

endmodule 