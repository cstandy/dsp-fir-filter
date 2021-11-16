module dff_16b(dout, din, clk, rst);

  input             clk;
  input             rst;
  input [15:0]      din;
  output reg [15:0] dout;
  
  always @(posedge clk) begin
    if (rst)
      dout <= 0;
    else 
      dout <= din;
    end

endmodule