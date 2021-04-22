`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:01:13 04/21/2021 
// Design Name: 
// Module Name:    EXMEMregister 
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
module EXMEMregister(
   input [31:0] ALUout_i,
	input [31:0] Op2_i,
	output reg [31:0] ALUout_o,
	output reg [31:0] Op2_o,
	input [4:0] RegDest_i,
	output reg [4:0] RegDest_o,
	input RegWrite,
	output reg regWrite,
	input clk,
	input reset,
	input MemRead_i, MemWrite_i, MemtoReg_i,
	output reg MemRead_o, MemWrite_o, MemtoReg_o
	
    );
	
	 
	 always @ (posedge clk, posedge reset)
begin
	 if (reset == 1)
	 begin
	 ALUout_o <= 32'b0;
	 Op2_o <= 32'b0;
	 regWrite <= 1'b0;
	 RegDest_o <= 3'b0;
	 MemRead_o <= 0;
	 MemWrite_o <= 0;
	 MemtoReg_o <= 0;
	 
	 end
	 else 
	 begin
	 ALUout_o <= ALUout_i;
	 Op2_o <= Op2_i;
	 regWrite <= RegWrite;
	 RegDest_o <= RegDest_i;
	 MemRead_o <= MemRead_i;
	 MemWrite_o <= MemWrite_i;
	 MemtoReg_o <= MemtoReg_i;
	 end

	 
end

endmodule