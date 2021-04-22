`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:30:42 02/18/2021 
// Design Name: 
// Module Name:    Mux_3to1 
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
module Mux_3to1
	(
	i_bit1,
	i_bit2,
	i_bit3,
	i_bit4,
	i_bitS,
	o_out
	);
	 
	input  i_bit1;
	input  i_bit2;
	input  i_bit3;
	input  i_bit4;
	input  [1:0] i_bitS;
	output reg o_out;
		
	always @(i_bit1, i_bit2, i_bit3, i_bit4, i_bitS)
	begin
	case (i_bitS)
	
		2'b00: o_out = i_bit1;
		2'b01: o_out = i_bit2;
		2'b10: o_out = i_bit3;
		2'b11: o_out = i_bit4;
		default: o_out = i_bit1;
		
		
	endcase
	end
	
endmodule
