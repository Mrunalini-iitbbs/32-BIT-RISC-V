`timescale 1ns/1ps

module mux3(A,B,C,SEL,OUT);
input [31:0] A,B,C;
input [1:0] SEL;
output [31:0] OUT;
assign OUT = SEL[1]?C:(SEL[0]?B:A);
endmodule

