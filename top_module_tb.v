`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.09.2023 21:24:21
// Design Name: 
// Module Name: top_module_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module topModule_tb;
reg clk,rst;
wire [31:0]write_data,data_addr,pc;
wire mem_write;


topModule DUT(clk,rst,write_data,data_addr,pc,mem_write);

initial
begin
DUT.rv.d.rf.RF[1]=32'd10;
DUT.rv.d.rf.RF[2]=32'd10;
DUT.rv.d.rf.RF[3]=32'd0;
DUT.rv.d.rf.RF[4]=32'd0;
DUT.rv.d.rf.RF[5]=32'd1;
end

initial
begin
$monitor("time=%d sum of 10 Natural numbers=%d",$time,DUT.dm.RAM[0]);
clk=1'b0;
rst=1'b0;
#8 rst=1'b1;
#4 rst=1'b0;
#700 $finish;
end

always #10 clk=~clk;
endmodule

