`timescale 1ns/1ps
module instruct_Memory(A,RD);
input [5:0] A;
output reg [31:0] RD;

reg [31:0] RAM [0:63];

initial
    begin
    $readmemb("instruc.mem",RAM);
    end

// Current instruction assignment
always @(A)
RD=RAM[A];

endmodule