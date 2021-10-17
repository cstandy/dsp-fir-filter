`define OPERAND_SIZE 8
`define COUNTER_SIZE 5
`define TRUE  1
`define FALSE 0

module booth_mult(clk, enable, finish, product, multiplicand, multiplier);

input                        clk;
input                        enable;
input  [`OPERAND_SIZE-1:0]   multiplicand;
input  [`OPERAND_SIZE-1:0]   multiplier;
output [2*`OPERAND_SIZE-1:0] product;
output                       finish;

reg                          rst;
wire   [`OPERAND_SIZE-1:0]   m   = multiplicand;
wire   [`OPERAND_SIZE-1:0]   m_b = ~m + 1;
reg    [`COUNTER_SIZE-1:0]   counter;
reg                          finish;
reg    [2*`OPERAND_SIZE:0]   P;
wire   [2*`OPERAND_SIZE:0]   A = {m,   `OPERAND_SIZE'b0, 1'b0};
wire   [2*`OPERAND_SIZE:0]   S = {m_b, `OPERAND_SIZE'b0, 1'b0};
wire   [2*`OPERAND_SIZE-1:0] product = P[2*`OPERAND_SIZE:1]; // Drop SLB

reg    [2*`OPERAND_SIZE:0]   sumPS;
reg    [2*`OPERAND_SIZE:0]   sumPA;
reg    [2*`OPERAND_SIZE:0]   nxtPS;
reg    [2*`OPERAND_SIZE:0]   nxtPA;
reg    [2*`OPERAND_SIZE:0]   nxtP;

// Do arithmetic right shift one bit
always @(*) begin
  sumPS = P + S;
  sumPA = P + A;
  nxtPS = sumPS >> 1;
  nxtPA = sumPA >> 1;
  nxtPS[2*`OPERAND_SIZE] = sumPS[2*`OPERAND_SIZE];
  nxtPA[2*`OPERAND_SIZE] = sumPA[2*`OPERAND_SIZE];
  nxtP  = P >> 1;
  nxtP[2*`OPERAND_SIZE] = P[2*`OPERAND_SIZE];
end

always @(posedge enable) begin
                 rst <= `TRUE;
  @(posedge clk) rst <= `FALSE;
end

always @(posedge clk) begin
  if (rst) begin
    P       <= {`OPERAND_SIZE'b0, multiplier, 1'b0};
    counter <= `COUNTER_SIZE'b0;
    finish  <= `FALSE;
  end
  else if (counter == `OPERAND_SIZE) begin
    P       <= P;
    counter <= counter;
    finish  <= `TRUE;
  end
  else begin
    case (P[1:0])
      2'b00:   P <= nxtP;
      2'b01:   P <= nxtPA;
      2'b10:   P <= nxtPS;
      2'b11:   P <= nxtP;
      default: P <= P;
    endcase
    counter <= counter + 1;
    finish  <= `FALSE;
  end
end

endmodule
