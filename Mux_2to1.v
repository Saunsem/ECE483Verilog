`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:46:32 02/25/2021 
// Design Name: 
// Module Name:    Mux_2to1 
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
module Mux_2to1(

   input i_bit1,
	input i_bit2,
	input  i_bitS,
	output reg o_out
	 
    );
		
	always @(i_bit1, i_bit2, i_bitS)
	begin
	case (i_bitS)
	
		0: o_out <= i_bit1;
		1: o_out <= i_bit2;
		
	endcase
	end


endmodule
