`timescale 1ns/1ps
`define CYCLE 10.0

`include "top.v"

module top_tb();

reg         clk;
reg         rst;
reg  [7:0]  din;
reg  [7:0]  c0;
reg  [7:0]  c1;
reg  [7:0]  c2;
wire [15:0] dout;

top t1(
    .y   (dout),
    .x   (din ),
    .c0  (c0  ),
    .c1  (c1  ),
    .c2  (c2  ),
    .clk (clk ),
    .rst (rst )
);

initial clk = 1;
always #(`CYCLE/2) clk = ~clk;

initial begin

$display("Setup reg");
/* Setup registers */
#(`CYCLE/2) rst = 1; din = 0; c0 = 0; c1 = 0; c2 = 0;
#(`CYCLE/2) rst = 0;

$display("Init c");
/* Assign the coefficient */
// #(`CYCLE) din =  44; c0 = 1; c1 = 2; c2 = 3;
// #(`CYCLE) din = -81;
#(`CYCLE) din = -91; c0 = 1; c1 = 2; c2 = 3;
#(`CYCLE) din = 107;

$display("Start read");
/* Start to read the result since the third cycle */
// #(`CYCLE)   din = -11; #(`CYCLE/2)$display("dout: %d", $signed(dout));
// #(`CYCLE/2) din =  64; #(`CYCLE/2)$display("dout: %d", $signed(dout));
// #(`CYCLE/2) din = -61; #(`CYCLE/2)$display("dout: %d", $signed(dout));
// #(`CYCLE/2) din = 123; #(`CYCLE/2)$display("dout: %d", $signed(dout));
// #(`CYCLE/2) din =  67; #(`CYCLE/2)$display("dout: %d", $signed(dout));
// #(`CYCLE/2) din = -25; #(`CYCLE/2)$display("dout: %d", $signed(dout));

#(`CYCLE)   din =  12; #(`CYCLE/2)$display("dout: %d", $signed(dout));
#(`CYCLE/2) din = -56; #(`CYCLE/2)$display("dout: %d", $signed(dout));
#(`CYCLE/2) din = 127; #(`CYCLE/2)$display("dout: %d", $signed(dout));
#(`CYCLE/2) din =   9; #(`CYCLE/2)$display("dout: %d", $signed(dout));
#(`CYCLE/2) din =  75; #(`CYCLE/2)$display("dout: %d", $signed(dout));
#(`CYCLE/2) din =   5; #(`CYCLE/2)$display("dout: %d", $signed(dout));

$display("End");
/* Simulation ends */
#(`CYCLE/2) $finish;
end

initial begin
  $dumpfile("wave/top.vcd");
  $dumpvars;
end

endmodule
