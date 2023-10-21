`timescale 1ns/1ps

module ALU(SrcA,SrcB,ALUControl,ALUResult,EQ,GT,LT);
input [31:0] SrcA,SrcB;
input [2:0] ALUControl;
output reg [31:0] ALUResult;
output reg EQ,GT,LT;

always @(*)
begin
	case(ALUControl)
	3'b000: ALUResult = SrcA + SrcB;
	3'b001: ALUResult = SrcA - SrcB;
	3'b010: ALUResult = SrcA ^ SrcB;
	3'b011: ALUResult = SrcA | SrcB;
	3'b100: ALUResult = SrcA & SrcB;
	3'b101: ALUResult = SrcA << SrcB;
	3'b110: ALUResult = SrcA >> SrcB;
	3'b111: ALUResult = SrcA < SrcB;
	default:ALUResult = SrcA + SrcB;
	endcase
end

always@(*)
begin
EQ = (SrcA==SrcB);
LT = (SrcA<SrcB);
GT = (SrcA>SrcB);
end
endmodule
