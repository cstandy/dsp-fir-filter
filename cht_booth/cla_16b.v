`include "cla_4b.v"
// `include "cla_logic.v"

module cla_16b(s, cin, pg, gg, cout, a, b);

  input [15:0] a;
  input [15:0] b;
  input        cin;
  output [15:0] s;
  output        pg;
  output        gg;
  output reg    cout;
  wire [3:0] p;
  wire [3:0] g;
  wire [3:0] c;

  cla_4b ca0(.s(s[3 :0 ]), .cin(cin ), .pg(p[0]), .gg(g[0]), .a(a[3 :0 ]), .b(b[3 :0 ]));
  cla_4b ca1(.s(s[7 :4 ]), .cin(c[0]), .pg(p[1]), .gg(g[1]), .a(a[7 :4 ]), .b(b[7 :4 ]));
  cla_4b ca2(.s(s[11:8 ]), .cin(c[1]), .pg(p[2]), .gg(g[2]), .a(a[11:8 ]), .b(b[11:8 ]));
  cla_4b ca3(.s(s[15:12]), .cin(c[2]), .pg(p[3]), .gg(g[3]), .a(a[15:12]), .b(b[15:12]));

  cla_logic cla_l2(.pg(pg), .gg(gg), .cout(c), .p(p), .g(g), .cin(cin));
  always @(*) begin
    cout = c[3];
  end
endmodule
