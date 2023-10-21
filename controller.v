`timescale 1ns/1ps

module controller	(input f7b5,
					input [6:0] op,
					input [2:0] f3,
					input EQ,LT,GT,
					output pcSrc, MemWrite,ALUSrc,RegWrite,
					output [1:0] ResultSrc,ImmSrc,length,
					output [2:0] AluControl);

wire [1:0] aluop;
wire branch, jump;

main_Dec md(op,f3, branch, jump, ResultSrc, MemWrite, ALUSrc, ImmSrc, RegWrite, aluop, length);

alu_Dec ad(f7b5, op[5], f3, aluop, AluControl);

wire NEQ = ~EQ;
wire [1:0] sel = {f3[2],f3[0]};
wire and_in, and_out;

mux4 m4(EQ,NEQ,LT,GT,sel,and_in);

and(and_out,and_in,branch);
or(pcSrc,and_out,jump);

endmodule

