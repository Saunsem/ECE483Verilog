`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:03:57 02/18/2021
// Design Name:   Onebitadder
// Module Name:   /home/sesaund/ECE483Lab3/Onebitadder_tb.v
// Project Name:  ECE483Lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Onebitadder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Onebitadder_tb;

	// Outputs
	wire o_sum, o_carry;
	
	reg i_bit1, i_bit2, i_carry;

	// Instantiate the Unit Under Test (UUT)
	Onebitadder uut 
	(
		.o_sum(o_sum), .o_carry(o_carry), .i_bit1(i_bit1), 
		.i_bit2(i_bit2), .i_carry(i_carry)
	);

	initial begin
			
			i_bit1 = 0;
			i_bit2 = 0;
			i_carry = 0;
			#10;
			
			i_bit1 = 0;
			i_bit2 = 0;
			i_carry = 1;
			#10;
			
			i_bit1 = 0;
			i_bit2 = 1;
			i_carry = 0;
			#10;
			
			i_bit1 = 0;
			i_bit2 = 1;
			i_carry = 1;
			#10;
			
			i_bit1 = 1;
			i_bit2 = 0;
			i_carry = 0;
			#10;
			
			i_bit1 = 1;
			i_bit2 = 0;
			i_carry = 1;
			#10;
			
			i_bit1 = 1;
			i_bit2 = 1;
			i_carry = 0;
			#10;
			
			i_bit1 = 1;
			i_bit2 = 1;
			i_carry = 1;
			#10;
			
			$finish;
			

	end
      
endmodule

