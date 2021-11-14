`include "booth_mul_parallel.v"
module top(y, x, c, clk);

input                        clk;
input  [`OPERAND_SIZE-1:0]   x;
input  [`OPERAND_SIZE-1:0]   c [0:2];
output [2*`OPERAND_SIZE-1:0] y;

reg    [2*`OPERAND_SIZE-1:0] cx     [0:2];
wire   [2*`OPERAND_SIZE-1:0] dff_in;
reg    [2*`OPERAND_SIZE-1:0] dff    [0:1];

booth_mult m1(.product(cx[0]), .multiplicand(x), .multiplier(c[0]));
booth_mult m2(.product(cx[1]), .multiplicand(x), .multiplier(c[1]));
booth_mult m3(.product(cx[2]), .multiplicand(x), .multiplier(c[2]));

always @(posedge clk) begin
    dff[0] = cx[0];
    dff[1] = dff_in;
end

cla_16b c1(.s(dff_in), .cin(1'b0), .a(dff[0]), .b(cx[1]));
cla_16b c2(.s(y),      .cin(1'b0), .a(dff[1]), .b(cx[2]));

endmodule