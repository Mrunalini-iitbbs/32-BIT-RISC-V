`timescale 1ns/1ps

module mux4(in0, in1, in2, in3, sel, out);
input in0, in1, in2, in3;
input [1:0] sel;
output out;

assign out = sel[1]?(sel[0]?in3:in2):(sel[0]?in1:in0);

endmodule