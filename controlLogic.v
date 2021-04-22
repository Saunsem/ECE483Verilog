`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:46:01 03/18/2021 
// Design Name: 
// Module Name:    controlLogic 
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
module controlLogic( lw, sw, beq, regWrite, In);

input [31:0] In;
output reg lw;
output reg sw;
output reg beq;
output reg regWrite;


always @ (In)
	
		begin
		
	case (In [31:26])
	6'b100011: {lw,sw,beq,regWrite} = 4'b1000;
	6'b101011: {lw,sw,beq,regWrite} = 4'b0100;
	6'b000100: {lw,sw,beq,regWrite} = 4'b0010;
	6'b000000: {lw,sw,beq,regWrite} = 4'b0001;
	endcase
		
		end


endmodule
