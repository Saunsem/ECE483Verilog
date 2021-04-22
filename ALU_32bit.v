`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:07:29 02/25/2021 
// Design Name: 
// Module Name:    ALU_32bit 
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
module ALU_32bit(

	input [3:0] ALUctl,
	input [31:0] A,
	input [31:0] B,
	output [31:0] ALUout,
	output Zero,
	output Overflow
	
	
    );
	 
	 wire [31:0] carryin;
	 wire [31:0] carryout;
	 wire Ainvert;
	 assign Ainvert = ALUctl[3];
	 wire Binvert;
	 assign Binvert = ALUctl[2];
	 wire TransferB; 
	 assign TransferB = ALUctl[4];
	 wire [1:0] Operation;
	 assign Operation[0] = ALUctl[0];
	 assign Operation[1] = ALUctl[1];
	 assign carryin[0] = Binvert;
	 assign Zero = ~(|ALUout);
	 assign Overflow = carryout[31]; 
	 
	 ALU_1bit ALU0 (.i_bit1(A[0]), .i_bit2(B[0]), .i_carry(carryin[0]), .Ainvert(Ainvert), .Binvert(Binvert), .Operation(Operation[1:0]),
	 .o_result(ALUout[0]), .o_carry(carryout[0]));
	 
	generate
	genvar j;
	for (j=1; j<=31; j=j+1) begin : ljasdf
	
	ALU_1bit (.i_bit1(A[j]), .i_bit2(B[j]), .i_carry(carryout[j-1]), .Ainvert(Ainvert), .Binvert(Binvert), .Operation(Operation[1:0]),
	 .o_result(ALUout[j]), .o_carry(carryout[j]));
	 
	 end
	 endgenerate
	 

endmodule
