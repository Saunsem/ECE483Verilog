`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:51:37 04/15/2021 
// Design Name: 
// Module Name:    PCregister 
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
module PCregister(
   input [31:0] In,
	output reg [31:0] Out,
	input clk,
	input reset
	
    );
	
	 always @ (posedge clk, posedge reset)
begin
	 if (reset == 1)
	 begin
	 Out <= 32'b0;
	 
	 end
	 else 
	 begin
	 Out <= In;
	 end
end	 

endmodule
