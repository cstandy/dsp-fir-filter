`timescale 1ns/1ps
`define CYCLE 10.0

`include "booth_mult.v"

module mult_tb();

reg  [`OPERAND_SIZE-1:0]   A;
reg  [`OPERAND_SIZE-1:0]   B;
wire [2*`OPERAND_SIZE-1:0] P;

booth_mult bm(
  .product      (P),
  .multiplicand (A),
  .multiplier   (B)
);

initial begin
  A = 3; B = 4;
  #(`CYCLE/2)
  $display("A = %d, B = %d, P = %d", $signed(A), $signed(B), $signed(P));
  A = 255; B = 255;
  #(`CYCLE/2)
  $display("A = %d, B = %d, P = %d", $signed(A), $signed(B), $signed(P));
  A = -72; B = 0;
  #(`CYCLE/2)
  $display("A = %d, B = %d, P = %d", $signed(A), $signed(B), $signed(P));
  A = 36; B = 4;
  #(`CYCLE/2)
  $display("A = %d, B = %d, P = %d", $signed(A), $signed(B), $signed(P));
  A = -4; B = 3;
  #(`CYCLE/2)
  $display("A = %d, B = %d, P = %d", $signed(A), $signed(B), $signed(P));
  A = 3; B = -4;
  #(`CYCLE/2)
  $display("A = %d, B = %d, P = %d", $signed(A), $signed(B), $signed(P));
  A = -72; B = 50;
  #(`CYCLE/2)
  $display("A = %d, B = %d, P = %d", $signed(A), $signed(B), $signed(P));
  A = -72; B = 100;
  #(`CYCLE/2)
  $display("A = %d, B = %d, P = %d", $signed(A), $signed(B), $signed(P));
  A = 100; B = -72;
  #(`CYCLE/2)
  $display("A = %d, B = %d, P = %d", $signed(A), $signed(B), $signed(P));
  A = 127; B = 127;
  #(`CYCLE/2)
  $display("A = %d, B = %d, P = %d", $signed(A), $signed(B), $signed(P));
  A = -127; B = 127;
  #(`CYCLE/2)
  $display("A = %d, B = %d, P = %d", $signed(A), $signed(B), $signed(P));
  A = -127; B = -127;
  #(`CYCLE/2)
  $display("A = %d, B = %d, P = %d", $signed(A), $signed(B), $signed(P));
  A = 127; B = -127;
  #(`CYCLE/2)
  $display("A = %d, B = %d, P = %d", $signed(A), $signed(B), $signed(P));
  A = 127; B = -128;
  #(`CYCLE/2)
  $display("A = %d, B = %d, P = %d", $signed(A), $signed(B), $signed(P));
  A = -128; B = 127;
  #(`CYCLE/2)
  $display("A = %d, B = %d, P = %d", $signed(A), $signed(B), $signed(P));
  A = -128; B = -128;
  #(`CYCLE/2)
  $display("A = %d, B = %d, P = %d", $signed(A), $signed(B), $signed(P));
  A = -128; B = -110;
  #(`CYCLE/2)
  $display("A = %d, B = %d, P = %d", $signed(A), $signed(B), $signed(P));

  $finish;
end

initial begin
  $dumpfile("wave/booth_mult.vcd");
  $dumpvars;
end

endmodule
