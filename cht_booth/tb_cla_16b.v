`timescale 1ns/1ps
`define CYCLE 10.0

`include "cla_16b.v"

module cla_16b_tb();

reg  [15:0] a;
reg  [15:0] b;
reg        cin;
wire [15:0] s;
wire pg, gg, cout;

cla_16b cla_16b_1(
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

//               a = 7; b = 7; cin = 1;
//   #(`CYCLE/2) $display("a = %d, b = %d, cin = %d, s = %d, cout = %d, pg = %d, gg = %d",
//     $signed(a), $signed(b), cin, $signed(s), cout, pg, gg);
//   #(`CYCLE/2) a = -7; b = 7; cin = 0;
//   #(`CYCLE/2) $display("a = %d, b = %d, cin = %d, s = %d, cout = %d, pg = %d, gg = %d",
//     $signed(a), $signed(b), cin, $signed(s), cout, pg, gg);
//   #(`CYCLE/2) a = -7; b = 7; cin = 1;
//   #(`CYCLE/2) $display("a = %d, b = %d, cin = %d, s = %d, cout = %d, pg = %d, gg = %d",
//     $signed(a), $signed(b), cin, $signed(s), cout, pg, gg);
//   #(`CYCLE/2)

              a = 7865; b = 130; cin = 1;
  #(`CYCLE/2) $display("a = %d, b = %d, cin = %d, s = %d, cout = %d, pg = %d, gg = %d",
    $signed(a), $signed(b), cin, $signed(s), cout, pg, gg);
  #(`CYCLE/2) a = -483; b = 159; cin = 0;
  #(`CYCLE/2) $display("a = %d, b = %d, cin = %d, s = %d, cout = %d, pg = %d, gg = %d",
    $signed(a), $signed(b), cin, $signed(s), cout, pg, gg);
  #(`CYCLE/2) a = -483; b = -756; cin = 1;
  #(`CYCLE/2) $display("a = %d, b = %d, cin = %d, s = %d, cout = %d, pg = %d, gg = %d",
    $signed(a), $signed(b), cin, $signed(s), cout, pg, gg);
  #(`CYCLE/2) a = 32767; b = 0; cin = 1;
  #(`CYCLE/2) $display("a = %d, b = %d, cin = %d, s = %d, cout = %d, pg = %d, gg = %d",
    $signed(a), $signed(b), cin, $signed(s), cout, pg, gg);
  #(`CYCLE/2)
  $finish;
end

initial begin
  $dumpfile("wave/cla_16b.vcd");
  $dumpvars;
end

endmodule
