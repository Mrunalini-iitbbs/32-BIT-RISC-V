`timescale 1ns/1ps

module pc_Reg(CLK,RST,D,Q);
input CLK,RST;
input [31:0] D;
output reg [31:0] Q;

always @(posedge CLK)
begin
	if(RST)
	Q <= 32'd0;
	else
	Q <= D;
end
endmodule
