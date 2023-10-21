`timescale 1ns/1ps

module topModule(input clk,rst,
				output [31:0] write_data,data_addr,pc,
				output mem_write);
				
wire [31:0] instr, read_data;
wire [1:0] length;

dataMemory dm(data_addr,clk,mem_write,length, write_data, read_data);

instruct_Memory im(pc[5:0],instr);

riscv rv(clk, rst, instr, read_data, pc, write_data, data_addr, mem_write, length);

endmodule
