module test;
reg in1, in2, select;
wire out;

// design under test 
mux2_1 mux(.in1(in1), .in2(in2), 
            .select(select), .out(out));

// list the input to the design
initial begin in1=1'b0;in2=1'b0;select=1'b0; 
        #2    in1=1'b1;
        #2    select=1'b1;
        #2    in2=1'b1;
        #2    $stop();
        end

// monitor the output whenever any of the input changes
initial begin $monitor("time=%0d, input1=%b, input2=%b, select line=%b, output=%b", $time, in1, in2, select, out);
        end
endmodule