`timescale 1ns/1ps

module main_Dec(op, f3, branch, jump, ResultSrc, MemWrite, ALUSrc, ImmSrc, RegWrite, ALUop, length);

input [6:0] op;
input [2:0]f3;
output branch, jump, MemWrite, ALUSrc, RegWrite; 
output [1:0] ALUop, ResultSrc, ImmSrc, length;

reg [10:0] controls;
reg [1:0]length = 2'b10;

assign {RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, branch, ALUop, jump} = controls;
always @(*)
case(op)
	7'd3:   begin
			controls <= 11'b1_00_1_0_01_0_00_0; // LW 
			case(f3)
			3'b000: length = 2'b00;
			3'b001: length = 2'b01;
			3'b010: length = 2'b10;
			default : length = 2'b10;
			endcase
			end
	7'd35:  begin
			controls <= 11'b0_01_1_1_xx_0_00_0; // SW
			case(f3)
			3'b000: length = 2'b00;
			3'b001: length = 2'b01;
			3'b010: length = 2'b10;
			default : length = 2'b10;
			endcase
			end
	7'd51:  controls <= 11'b1_xx_0_0_00_0_10_0; // R-Type
	7'd99:  controls <= 11'b0_10_0_0_xx_1_01_0; // Branch
	7'd19:  controls <= 11'b1_00_1_0_00_0_10_0; // I-Type
	7'd111: controls <= 11'b1_11_x_0_10_0_xx_1; // J-Type
	default : controls <=11'bx_xx_x_x_xx_x_xx_x; // Default Case
endcase


endmodule
