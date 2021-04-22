`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:08:59 04/21/2021
// Design Name:   Lab7
// Module Name:   E:/Xilinx/Lab7/Lab7_tb.v
// Project Name:  Lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Lab7
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Lab7_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [31:0] PCin;

	// Instantiate the Unit Under Test (UUT)
	Lab7 uut (
		.clk(clk), 
		.reset(reset),
		.PCin(PCin)
	);

	initial begin
		// Initialize Inputs
		reset = 1;
		clk = 0;

		#2 reset = 0;
		
		@(posedge clk) PCin = 0;

		#200 $finish;
	end
	
	always 
	begin

	#10;

	clk = ~clk;
	end     
      
endmodule

