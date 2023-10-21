`timescale 1ns/1ps

module mux2(A,B,SEL,OUT);
input [31:0]A,B;
input SEL;
output [31:0]OUT;
assign OUT = SEL?B:A;
endmodule

