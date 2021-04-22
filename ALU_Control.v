`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:28:16 03/18/2021 
// Design Name: 
// Module Name:    ALU_Control 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU_Control( In, ALUOp, Out);

input [31:0] In;
input ALUOp;
output reg [3:0] Out;

always @ (In) 
	begin
	
	if (ALUOp == 0)
	begin
	Out = 4'b0011;
	end
	else if (In [5:0] == 6'b100000)
	Out = 4'b0010;
	else if (In [5:0] == 6'b100010)
	Out = 4'b0110;
	else if (In [5:0] == 6'b100100)
	Out = 4'b0000;
	else if (In [5:0] == 6'b100101)
	Out = 4'b0001;
	else if (In [5:0] == 6'b100111)
	Out = 4'b1100;
	
	end


endmodule
