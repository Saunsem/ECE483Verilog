`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:15:36 04/15/2021 
// Design Name: 
// Module Name:    IDEXregister 
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
module IDEXregister(
   input Control_i,
	input [31:0] Op1_i,
	input [31:0] Op2_i,
	input [31:0] In,
	input [31:0] Extended_i,
	input clk,
	input reset,
	output reg Control_o,
	output reg [31:0] Op1_o,
	output reg [31:0] Op2_o,
	output reg [31:0] Out,
	output reg [31:0] Extended_o,
	output reg [3:0] ALUctl,
	output reg ALUSrc, RegDst, MemRead, MemWrite, MemtoReg
	
    );

	 always @ (posedge clk, posedge reset)
begin
	 if (reset)
	 begin
	 Control_o <= 1'b0;
	 Op1_o <= 32'b0;
	 Op2_o <= 32'b0;
	 Out <= 32'b0;
	 Extended_o <= 32'b0;
	 ALUSrc <= 0;
	 RegDst <= 0;
	 MemWrite <= 0;
	 MemRead <= 0;
	 MemtoReg <= 0;
	 end
	 
	 else
	 begin
	 Control_o <= Control_i;
	 Op1_o <= Op1_i;
	 Op2_o<= Op2_i;
	 Out <= In;
	 Extended_o <= Extended_i;
	 ALUctl <= In[31:26];
	 end
	 
	 if ( In [31:26] == 6'b100011)
	 begin
	 ALUSrc <= 1;
	 RegDst <= 1;
	 MemWrite <= 0;
	 MemRead <= 1;
	 MemtoReg <= 0;
	 end
	 
	 if ( In [31:26] == 6'b101011)
	 begin
	 ALUSrc <= 1;
	 RegDst <= 1;
	 MemWrite <= 1;
	 MemRead <= 0;
	 MemtoReg <= 1;
	 end
	 
	 if ( In [31:26] == 6'b000000)
	 begin
	 ALUSrc <= 0;
	 RegDst <= 0;
	 MemWrite <= 0;
	 MemRead <= 0;
	 MemtoReg <= 1;
	 end
	 
	 
end

 
endmodule