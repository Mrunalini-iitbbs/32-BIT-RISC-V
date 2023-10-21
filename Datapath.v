`timescale 1ns/1ps

module Datapath(input CLK, RST,
				input [31:0] INSTR, READ_DATA,
				input PCSrc, 
				input [1:0] ResultSrc, 
				input RegWrite, ALUSrc,
				input [2:0] ALUControl,
				input [1:0] ImmSrc,
				output [31:0] PC, DATA_ADDR, WRITE_DATA,
				output EQ,GT,LT);
				
wire [31:0] PCNext, PCPlus4, PCTarget, ImmExt, SrcA, SrcB, Result;			
	
pc_Reg pcFF(CLK,RST,PCNext,PC);

adder a1(PC,32'd1,PCPlus4);

adder a2(PC,ImmExt,PCTarget);

imm_Ext i1(INSTR[31:7],ImmSrc,ImmExt);

mux2 m1(PCPlus4,PCTarget,PCSrc,PCNext);

mux2 m2(WRITE_DATA,ImmExt,ALUSrc,SrcB);

register_File rf(INSTR[19:15],INSTR[24:20],INSTR[11:7],Result,RegWrite,SrcA,WRITE_DATA,CLK);

ALU al(SrcA,SrcB,ALUControl,DATA_ADDR,EQ,GT,LT);

mux3 m3(DATA_ADDR,READ_DATA,PCPlus4,ResultSrc,Result);
endmodule
