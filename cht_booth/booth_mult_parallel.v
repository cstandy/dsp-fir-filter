`define OPERAND_SIZE 8
`define TRUE  1
`define FALSE 0

`include "booth_encoder.v"
`include "select_m.v"
`include "mux2_1_16b.v"

module booth_mult(product, multiplicand, multiplier);

input  [`OPERAND_SIZE-1:0]   multiplicand;
input  [`OPERAND_SIZE-1:0]   multiplier;
output [2*`OPERAND_SIZE-1:0] product;

wire   [`OPERAND_SIZE-1:0]   m   = multiplier;
wire   [`OPERAND_SIZE-1:0]   md  = multiplicand;

wire [3:0] inv;
wire [1:0] shift [0:3];

wire [`OPERAND_SIZE+1:0]   temp_a [0:3]; // Appends w/o Sign extend nor shift
wire [2*`OPERAND_SIZE-1:0] a      [0:3]; // Addends
reg [2*`OPERAND_SIZE-1:0]  p_sum  [0:1]; // Partial sum
reg [2*`OPERAND_SIZE-1:0]  sum;          // Final sum == product == final result

assign product = sum;

// Parallel encoding
booth_encoder be1(.inv(inv[0]), .shift(shift[0]), .in({m[1:0], 1'b0}));
booth_encoder be2(.inv(inv[1]), .shift(shift[1]), .in(m[3:1]        ));
booth_encoder be3(.inv(inv[2]), .shift(shift[2]), .in(m[5:3]        ));
booth_encoder be4(.inv(inv[3]), .shift(shift[3]), .in(m[7:5]        ));

// Mux select multiplicand
select_m sm1(.out(temp_a[0]), .in(md), .sel({inv[0], shift[0]}));
select_m sm2(.out(temp_a[1]), .in(md), .sel({inv[1], shift[1]}));
select_m sm3(.out(temp_a[2]), .in(md), .sel({inv[2], shift[2]}));
select_m sm4(.out(temp_a[3]), .in(md), .sel({inv[3], shift[3]}));

// Sign extend (temp_a is already extended 2 bits for local shift) and global shift
mux2_1_16b m1(.out(a[0]), .in1({6'b0, temp_a[0]}      ), .in2({6'b11_1111, temp_a[0]}      ), .select(temp_a[0][`OPERAND_SIZE+1]));
mux2_1_16b m2(.out(a[1]), .in1({4'b0, temp_a[1], 2'b0}), .in2({4'b1111,    temp_a[1], 2'b0}), .select(temp_a[1][`OPERAND_SIZE+1]));
mux2_1_16b m3(.out(a[2]), .in1({2'b0, temp_a[2], 4'b0}), .in2({2'b11,      temp_a[2], 4'b0}), .select(temp_a[2][`OPERAND_SIZE+1]));
mux2_1_16b m4(.out(a[3]), .in1({      temp_a[3], 6'b0}), .in2({            temp_a[3], 6'b0}), .select(temp_a[3][`OPERAND_SIZE+1]));

// Adder tree
always @(*) begin
    p_sum[0] = a[0] + a[1];
    p_sum[1] = a[2] + a[3];
    sum = p_sum[0] + p_sum[1];
end

endmodule
