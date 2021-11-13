`include "cla_1b.v"
`include "cla_logic.v"

module cla_4b(s, cin, pg, gg, cout, a, b);

  input [3:0] a;
  input [3:0] b;
  input       cin;
  output [3:0] s;
  output       pg;
  output       gg;
  output reg   cout;
  wire [3:0] p;
  wire [3:0] g;
  wire [3:0] c;

  cla_1b fa0(.s(s[0]), .cin(cin ), .p(p[0]), .g(g[0]), .a(a[0]), .b(b[0]));
  cla_1b fa1(.s(s[1]), .cin(c[0]), .p(p[1]), .g(g[1]), .a(a[1]), .b(b[1]));
  cla_1b fa2(.s(s[2]), .cin(c[1]), .p(p[2]), .g(g[2]), .a(a[2]), .b(b[2]));
  cla_1b fa3(.s(s[3]), .cin(c[2]), .p(p[3]), .g(g[3]), .a(a[3]), .b(b[3]));

  cla_logic cla_l1(.pg(pg), .gg(gg), .cout(c), .p(p), .g(g), .cin(cin));
  always @(*) begin
    cout = c[3];
  end
endmodule
