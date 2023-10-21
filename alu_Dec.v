`timescale 1ns/1ps

module alu_Dec(f7b5, op5, f3, aluop, aluControl);
input f7b5, op5;
input [2:0] f3;
input [1:0] aluop;
output reg [2:0] aluControl;

assign stype = f7b5 & op5;
always @(*)
begin
	
	case(aluop)
	2'b00: aluControl = 3'b000;
	2'b10: case ({stype,f3})
			4'b0000: aluControl <= 3'b000;
			4'b1000: aluControl <= 3'b001;
			4'b0100: aluControl <= 3'b010;
			4'b0110: aluControl <= 3'b011;
			4'b0111: aluControl <= 3'b100;
			4'b0001: aluControl <= 3'b101;
			4'b0101: aluControl <= 3'b110;
			4'b0010: aluControl <= 3'b111;
			default: aluControl <= 3'b000;
			endcase
	endcase
end
endmodule
