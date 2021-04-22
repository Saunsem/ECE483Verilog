`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:52:22 04/21/2021 
// Design Name: 
// Module Name:    Mux2to1_5bit 
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
module Mux2to1_5bit(
   input [5:0] i_bit1,
	input [5:0] i_bit2,
	input  i_bitS,
	output reg [5:0] o_out
	 
    );
		
	always @(i_bit1, i_bit2, i_bitS)
	begin
	case (i_bitS)
	
		0: o_out <= i_bit1;
		1: o_out <= i_bit2;
		
	endcase
	end


endmodule