`timescale 1ns/1ps
module dataMemory (A,CLK,WE,DATA_LENGTH,WD,RD);
input [31:0]A,WD;
input CLK,WE;
input [1:0] DATA_LENGTH;
output reg [31:0] RD;

reg [31:0] RAM [0:63];
reg [31:0] a;

// Read Data
always@(posedge CLK)
    begin
        a=RAM[A[31:2]];
	    case(DATA_LENGTH)
		    2'b00:   RD={{24{a[7]}},a[7:0]};
			2'b01:   RD={{16{a[15]}},a[15:0]};
			2'b10:   RD=a;
			default: RD=a;
	    endcase
	end
	
// Write Data
always@(posedge CLK)
    
    begin
	if(WE)
	    begin
		    case(DATA_LENGTH)
		    2'b00:RAM[A[31:2]][7:0]=WD[7:0];
			2'b01:RAM[A[31:2]][15:0]=WD[15:0];
			2'b10:RAM[A[31:2]]=WD[31:0];
			default:RAM[A[31:2]]=WD[31:0];
	    endcase
	    end
	end
endmodule