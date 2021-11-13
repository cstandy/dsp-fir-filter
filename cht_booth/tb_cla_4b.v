`timescale 1ns/1ps
`define CYCLE 10.0

`include "cla_4b.v"

module cla_4b_tb();

reg  [3:0] a;
reg  [3:0] b;
reg        cin;
wire [3:0] s;
wire pg, gg, cout;

cla_4b cla_4b_1(
  .s    (s   ),
  .cin  (cin ),
  .pg   (pg  ),
  .gg   (gg  ),
  .cout (cout),
  .a    (a   ),
  .b    (b   )
);

initial begin
              a = 0; b = 0; cin = 0;
  #(`CYCLE/2) $display("a = %d, b = %d, cin = %d, s = %d, cout = %d, pg = %d, gg = %d",
    a, b, cin, s, cout, pg, gg);
//   #(`CYCLE/2) a = 0; b = 0; cin = 1;
//   #(`CYCLE/2) $display("a = %d, b = %d, cin = %d, s = %d, cout = %d, pg = %d, gg = %d",
//     a, b, cin, s, cout, pg, gg);
//   #(`CYCLE/2) a = 0; b = 1; cin = 0;
//   #(`CYCLE/2) $display("a = %d, b = %d, cin = %d, s = %d, cout = %d, pg = %d, gg = %d",
//     a, b, cin, s, cout, pg, gg);
//   #(`CYCLE/2) a = 0; b = 1; cin = 1;
//   #(`CYCLE/2) $display("a = %d, b = %d, cin = %d, s = %d, cout = %d, pg = %d, gg = %d",
//     a, b, cin, s, cout, pg, gg);
//   #(`CYCLE/2) a = 1; b = 0; cin = 0;
//   #(`CYCLE/2) $display("a = %d, b = %d, cin = %d, s = %d, cout = %d, pg = %d, gg = %d",
//     a, b, cin, s, cout, pg, gg);
//   #(`CYCLE/2) a = 1; b = 0; cin = 1;
//   #(`CYCLE/2) $display("a = %d, b = %d, cin = %d, s = %d, cout = %d, pg = %d, gg = %d",
//     a, b, cin, s, cout, pg, gg);
//   #(`CYCLE/2) a = 1; b = 1; cin = 0;
//   #(`CYCLE/2) $display("a = %d, b = %d, cin = %d, s = %d, cout = %d, pg = %d, gg = %d",
//     a, b, cin, s, cout, pg, gg);
//   #(`CYCLE/2) a = 1; b = 1; cin = 1;
//   #(`CYCLE/2) $display("a = %d, b = %d, cin = %d, s = %d, cout = %d, pg = %d, gg = %d",
//     a, b, cin, s, cout, pg, gg);
//   #(`CYCLE/2)

              a = 7; b = 7; cin = 1;
  #(`CYCLE/2) $display("a = %d, b = %d, cin = %d, s = %d, cout = %d, pg = %d, gg = %d",
    $signed(a), $signed(b), cin, $signed(s), cout, pg, gg);
  #(`CYCLE/2) a = -7; b = 7; cin = 0;
  #(`CYCLE/2) $display("a = %d, b = %d, cin = %d, s = %d, cout = %d, pg = %d, gg = %d",
    $signed(a), $signed(b), cin, $signed(s), cout, pg, gg);
  #(`CYCLE/2) a = -7; b = 7; cin = 1;
  #(`CYCLE/2) $display("a = %d, b = %d, cin = %d, s = %d, cout = %d, pg = %d, gg = %d",
    $signed(a), $signed(b), cin, $signed(s), cout, pg, gg);
  #(`CYCLE/2)
  $finish;
end

initial begin
  $dumpfile("wave/cla_4b.vcd");
  $dumpvars;
end

endmodule
