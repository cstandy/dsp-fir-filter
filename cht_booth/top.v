`include "booth_mult.v"
`include "dff_16b.v"

module top(y, x, c0, c1, c2, clk, rst);

input                        clk;
input                        rst;
input  [`OPERAND_SIZE-1:0]   x;
input  [`OPERAND_SIZE-1:0]   c0;
input  [`OPERAND_SIZE-1:0]   c1;
input  [`OPERAND_SIZE-1:0]   c2;
output [2*`OPERAND_SIZE-1:0] y;

wire   [`OPERAND_SIZE-1:0]   c      [0:2];
wire   [2*`OPERAND_SIZE-1:0] cx     [0:2];
wire   [2*`OPERAND_SIZE-1:0] dff_in;
wire   [2*`OPERAND_SIZE-1:0] dff    [0:1];

assign c[0] = c0;
assign c[1] = c1;
assign c[2] = c2;

booth_mult m1(.product(cx[0]), .multiplicand(x), .multiplier(c[0]));
booth_mult m2(.product(cx[1]), .multiplicand(x), .multiplier(c[1]));
booth_mult m3(.product(cx[2]), .multiplicand(x), .multiplier(c[2]));

dff_16b d1(.clk(clk), .rst(rst), .din(cx[0] ), .dout(dff[0]));
dff_16b d2(.clk(clk), .rst(rst), .din(dff_in), .dout(dff[1]));

cla_16b ca1(.s(dff_in), .cin(1'b0), .a(dff[0]), .b(cx[1]));
cla_16b ca2(.s(y),      .cin(1'b0), .a(dff[1]), .b(cx[2]));

endmodule