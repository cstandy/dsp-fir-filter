module mux2_1(out, in1, in2, select);

output out;
input in1, in2, select;
wire T1, T2, selectbar;

// and (T1, in2, select), (T2, in1, selectbar);
// not (selectbar, select);
// or (out, T1, T2);

and (T1, in2, select);
nor (T2, ~in1, select);
or (out, T1, T2);

endmodule
