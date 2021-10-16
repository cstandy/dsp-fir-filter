`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/16 15:27:57
// Design Name: 
// Module Name: test_FIR
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


module test_FIR(    );
reg clk;
reg reset;
reg[7:0] din;
reg[7:0] c0, c1, c2;
wire[15:0] dout;

FIR F1 (.clk(clk),.reset(reset),.din(din),.c0(c0),.c1(c1),.c2(c2),.dout(dout));

initial clk = 0;
always #5 clk= ~clk;

initial begin
#10;
reset = 1;
#10;
reset = 0;
din = 1; c0 = 1; c1 = 1; c2 = 1;#10;

end
 


endmodule
