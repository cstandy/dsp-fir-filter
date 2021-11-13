module cla_logic(pg, gg, cout, p, g, cin);

  input [3:0] p;
  input [3:0] g;
  input cin;
  output reg [3:0] cout;
  output reg pg;
  output reg gg;

  always @(*) begin
    cout[0] = g[0] | (p[0] & cin);
    cout[1] = g[1] | (g[0] & p[1]) | (cin & p[0] & p[1]);
    cout[2] = g[2] | (g[1] & p[2]) | (g[0] & p[1] & p[2]) |
              (cin & p[0] & p[1] & p[2]);
    cout[3] = g[3] | (g[2] & p[3]) | (g[1] & p[2] & p[3]) |
              (g[0] & p[1] & p[2] & p[3]) | (cin & p[0] & p[1] & p[2] & p[3]);
    pg = p[0] & p[1] & p[2] & p[3];
    gg = g[3] | (g[2] & p[3]) | (g[1] & p[2] & p[3]) |
              (g[0] & p[1] & p[2] & p[3]);
    // cg = gg | (pg & cin);
  end

endmodule
