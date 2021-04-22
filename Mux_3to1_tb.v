`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:31:35 02/18/2021
// Design Name:   Mux_3to1
// Module Name:   /home/sesaund/ECE483Lab3/Mux_3to1_tb.v
// Project Name:  ECE483Lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux_3to1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mux_3to1_tb;

	// Inputs
	reg i_bit1;
	reg i_bit2;
	reg i_bit3;
	reg i_bit4;
	reg [1:0] i_bitS;

	// Outputs
	wire o_out;

	// Instantiate the Unit Under Test (UUT)
	Mux_3to1 uut (
		.i_bit1(i_bit1), 
		.i_bit2(i_bit2), 
		.i_bit3(i_bit3), 
		.i_bit4(i_bit4),
		.i_bitS(i_bitS), 
		.o_out(o_out)
	);

	initial begin
		
		i_bit1 = 0;
		i_bit2 = 1;
		i_bit3 = 0;
		i_bit4 = 1;
		i_bitS = 0;
		#10;
		
		i_bitS = 1;
		#10;
		
		i_bitS = 2;
		#10;
		
		$finish;

	end
      
endmodule

