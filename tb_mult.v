`timescale 1ns/1ps
`define CYCLE 10.0

`include "booth_mult.v"

module mult_tb();

reg                        enable;
reg                        clk;
wire                       f;
reg  [`OPERAND_SIZE-1:0]   A;
reg  [`OPERAND_SIZE-1:0]   B;
wire [2*`OPERAND_SIZE-1:0] P;

booth_mult bm(
  .clk          (clk   ),
  .enable       (enable),
  .finish       (f     ),
  .product      (P     ),
  .multiplicand (A     ),
  .multiplier   (B     )
);

always #(`CYCLE/2) clk = ~clk;

initial begin
                              enable = 0; clk = 0; A = -72; B = 100;
  #(`CYCLE/2)                 enable = 1;
  #(`OPERAND_SIZE/2*`CYCLE+1) enable = 0;
end

always @(*) begin
  if (f) begin
    $display("A = %d, B = %d, P = %d", $signed(A), $signed(B), $signed(P));
    $finish;
  end
end

initial begin
  $dumpfile("wave/booth_mult.vcd");
  $dumpvars;
end

endmodule
