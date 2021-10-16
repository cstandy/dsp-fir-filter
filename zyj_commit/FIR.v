`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/16 14:56:15
// Design Name: 
// Module Name: FIR
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FIR(
input clk,
input reset,
input [7:0] din,
input [7:0] c0,
input [7:0] c1,
input [7:0] c2,
output [15:0] dout
    );

wire[15:0] mult_out2, mult_out1, mult_out0;
wire[15:0] add_out1,add_out2;
wire[15:0] d1_out,d2_out;

assign mult_out2 = din * c2;
assign mult_out1 = din * c1;
assign mult_out0 = din * c0;

dff d1 (.clk(clk),.reset(reset),.din(mult_out2),.dout(d1_out));

assign add_out1 = d1_out + mult_out1;

dff d2 (.clk(clk),.reset(reset),.din(add_out1),.dout(d2_out));

assign add_out2 = d2_out + mult_out0;
assign dout = add_out2;  
  
endmodule

module dff(
input clk,
input reset,
input[15:0] din,
output reg[15:0] dout
);

always @ (posedge clk)
begin
    if (reset)
        dout <= 0;
    else 
        dout <= din;
end

endmodule

