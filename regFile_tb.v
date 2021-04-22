`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:28:40 03/18/2021
// Design Name:   regFile
// Module Name:   /home/sesaund/ECE483Lab3/regFile_tb.v
// Project Name:  ECE483Lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: regFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module regFile_tb;

	// Inputs
	reg [31:0] Ip1;
	reg [4:0] sel_i1;
	reg [4:0] sel_o1;
	reg [4:0] sel_o2;
	reg RD;
	reg WR;
	reg rst;
	reg EN;
	reg clk;

	// Outputs
	wire [31:0] Op1;
	wire [31:0] Op2;

	// Instantiate the Unit Under Test (UUT)
	regFile uut (
		.Ip1(Ip1), 
		.sel_i1(sel_i1), 
		.Op1(Op1), 
		.sel_o1(sel_o1), 
		.Op2(Op2), 
		.sel_o2(sel_o2), 
		.RD(RD), 
		.WR(WR), 
		.rst(rst), 
		.EN(EN), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
  Ip1  = 32'b0;

  sel_i1  = 5'b0;

  sel_o1  = 5'b0;

  sel_o2  = 5'b0;

  RD  = 1'b0;

  WR  = 1'b0;

  rst  = 1'b1;

  EN  = 1'b1;

  clk  = 1'b0;

  #3;        

  // Add stimulus here

	rst  = 1'b0;
   

   #20;
	RD = 1'b1;
   WR  = 1'b1;
	sel_o1 = 4;
	sel_o2 = 6;
	sel_i1 = 2;
	Ip1 = 14;
	
	#20
	RD = 1'b1;
   WR  = 1'b1;
	sel_o1 = 2;
	sel_o2 = 4;
	sel_i1 = 10;
	Ip1 = 7;
	
	#20
	RD = 1'b1;
   WR  = 1'b0;
	sel_o1 = 7;
	sel_o2 = 7;

   #20
	RD = 1'b1;
   WR  = 1'b0;
	sel_o1 = 0;
	sel_o2 = 10;
	
	#20
	RD = 1'b1;
   WR  = 1'b1;
	sel_o1 = 6;
	sel_o2 = 8;
	sel_i1 = 6;
	Ip1 = 0;
	

   #40 $finish;

 end 

   always begin

  #10;

  clk = ~clk;

 end 

endmodule

