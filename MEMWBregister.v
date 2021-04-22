`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:01 04/21/2021 
// Design Name: 
// Module Name:    MEMWBregister 
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
module MEMWBregister(
   input [31:0] dat1_i,
	input [31:0] dat2_i,
	output reg [31:0] dat1_o,
	output reg [31:0] dat2_o,
	input [4:0] RegDest_i,
	output reg [4:0] RegDest_o,
	input RegWrite,
	output reg regWrite,
	input clk,
	input reset,
	input MemtoReg_i,
	output reg MemtoReg_o
	
    );
	
	 
	 always @ (posedge clk, posedge reset)
begin
	 if (reset == 1)
	 begin
	 dat1_o <= 32'b0;
	 dat2_o <= 32'b0;
	 regWrite <= 1'b0;
	 RegDest_o <= 3'b0;
	 MemtoReg_o <= 0;
	 
	 end
	 else 
	 begin
	 dat1_o <= dat1_i;
	 dat2_o <= dat2_i;
	 regWrite <= RegWrite;
	 RegDest_o <= RegDest_i;
	 MemtoReg_o <= MemtoReg_i;
	 end

	 
end

endmodule