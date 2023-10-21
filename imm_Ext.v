`timescale 1ns/1ps

module imm_Ext(imm_in,imm_src,imm_out);
input [1:0]imm_src;
input [31:7]imm_in;
output reg [31:0]imm_out;

// Immediate extension logic
always@(*)
    begin
	    case(imm_src)
		    2'b00:imm_out={{20{imm_in[31]}},imm_in[31:20]}; //I-type
			2'b01:imm_out={{20{imm_in[31]}},imm_in[31:25],imm_in[11:7]}; //S-type
			2'b10:imm_out={{20{imm_in[31]}},imm_in[7],imm_in[30:25],imm_in[11:8],1'b0}; //B-type
			2'b11:imm_out={{12{imm_in[31]}},imm_in[19:12],imm_in[20],imm_in[30:21],1'b0}; //J-type
			default:imm_out=32'bx;
		endcase
	end
endmodule