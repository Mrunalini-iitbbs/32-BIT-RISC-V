`timescale 1ns/1ps

module register_File(A1,A2,A3,WD3,WE3,RD1,RD2,CLK);
input CLK, WE3;
input [4:0] A1,A2,A3;
input [31:0] WD3;
output [31:0] RD1,RD2;

reg [31:0] RF[0:31];

always @(posedge CLK)
begin
	if(WE3)
	RF[A3] = WD3;
end

assign RD1 = (A1!=0) ? RF[A1]:0;
assign RD2 = (A2!=0) ? RF[A2]:0;
endmodule