`timescale 1ns/1ps
`define CYCLE 10.0

`include "fadder.v"

module fadder_tb();

reg  a, b, cin;
wire p, g, s, cout;

fadder fa(
  .a    (a   ),
  .b    (b   ),
  .cin  (cin ),
  .s    (s   ),
  .p    (p   ),
  .g    (g   ),
  .cout (cout)
);

initial begin
              a = 0; b = 0; cin = 0;
  #(`CYCLE/2) a = 0; b = 0; cin = 1;
  #(`CYCLE/2) a = 0; b = 1; cin = 0;
  #(`CYCLE/2) a = 0; b = 1; cin = 1;
  #(`CYCLE/2) a = 1; b = 0; cin = 0;
  #(`CYCLE/2) a = 1; b = 0; cin = 1;
  #(`CYCLE/2) a = 1; b = 1; cin = 0;
  #(`CYCLE/2) a = 1; b = 1; cin = 1;
  $finish;
end

always @(s or cout or p or g) begin
  $display("a = %d, b = %d, cin = %d, s = %d, cout = %d, p = %d, g = %d",
    a, b, cin, s, cout, p, g);
end

initial begin
  $dumpfile("wave/fadder.vcd");
  $dumpvars;
end

endmodule
