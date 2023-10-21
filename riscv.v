`timescale 1ns/1ps

module riscv(input clk,rst,
			input [31:0] instr, read_data,
			output [31:0] pc, write_data, Data_addr,
			output mem_write,
			output [1:0] length);
			
wire EQ,LT,GT,pcSrc,aluSrc,reg_write;
wire [1:0] ResultSrc, ImmSrc;
wire [2:0] aluControl;
controller c(instr[30],instr[6:0],instr[14:12],EQ,LT,GT,pcSrc,mem_write,aluSrc,reg_write,ResultSrc, ImmSrc, length, aluControl);

Datapath d(clk,rst,instr,read_data,pcSrc,ResultSrc,reg_write, aluSrc, aluControl, ImmSrc, pc, Data_addr, write_data, EQ,GT,LT);

endmodule
