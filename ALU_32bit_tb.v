`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:31:05 02/25/2021
// Design Name:   ALU_32bit
// Module Name:   /home/sesaund/ECE483Lab3/ALU_32bit_tb.v
// Project Name:  ECE483Lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_32bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_32bit_tb;

	// Inputs
	reg [3:0] ALUctl;
	reg [31:0] A;
	reg [31:0] B;

	// Outputs
	wire [31:0] ALUout;
	wire Zero;
	wire Overflow;

	// Instantiate the Unit Under Test (UUT)
	ALU_32bit uut (
		.ALUctl(ALUctl), 
		.A(A), 
		.B(B), 
		.ALUout(ALUout), 
		.Zero(Zero), 
		.Overflow(Overflow)
	);

initial begin

		A = 32'hffff_fffd;
		B = 32'h0000_0007;
		
		    ALUctl = 4'b0010;
		#10 ALUctl = 4'b0110;
		#10 ALUctl = 4'b1100;
		#10 ALUctl = 4'b0000;
		#10;
		
		A = 32'h7000_0000;
		B = 32'h3000_0000;		
		
		    ALUctl = 4'b1101;
		#10 ALUctl = 4'b0010;
		#10 ALUctl = 4'b0001;
		#10 ALUctl = 4'b0110;
		#10;
		
		A = 32'ha000_0000;
		B = 32'hc000_0000;
		
		    ALUctl = 4'b0010;
		#10 ALUctl = 4'b0110;
		#10 ALUctl = 4'b0001;

		#10 $finish();
		
	end
      
endmodule