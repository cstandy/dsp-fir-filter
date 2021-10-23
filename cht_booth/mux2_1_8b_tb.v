module test;
reg [7:0] in1;
reg [7:0] in2; 
reg select;
wire [7:0] out;

// design under test 
mux2_1_8b mux(.out    (out   ),
              .in1    (in1   ),
              .in2    (in2   ), 
              .select (select) 
             );

// list the input to the design
initial begin in1=8'd19; in2=8'd63; select=1'd0; 
        #2    in1=8'd1;
        #2                          select=1'b1;
        #2               in2=8'd0;
        #2    $stop();
        end

// monitor the output whenever any of the input changes
initial begin $monitor("time=%0d, input1=%d, input2=%d, select line=%b, output=%d", $time, in1, in2, select, out);
        end
endmodule