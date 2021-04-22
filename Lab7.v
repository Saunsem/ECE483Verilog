`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:33 04/21/2021 
// Design Name: 
// Module Name:    Lab7 
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
module Lab7(
	input clk, 
	input reset,
	input [31:0] PCin
    );

	
	wire [31:0] PCout;
	wire [31:0] IFIDin;
	wire [31:0] IFIDout;
	wire [31:0] IDEXin;
	wire lw;
	wire sw;
	wire beq;
	wire regWrite;
	wire regWrite1, regWrite2, regWrite3;
	wire [31:0] Op1, Op2;
	wire [31:0] Op1_o, Op2_o;
	wire RD = 1;
	wire EN = 1;
	wire [31:0] extendedin;
	wire [31:0] extendedout;
	wire [31:0] IDEXout;
	wire [3:0] aluctl;
	wire B = 4;
	wire [31:0] mux1_o, mux2_o, mux2out, mux2end, mux3_o;
	wire [31:0] ALUout, ALUout_o, Op2out, ALUout1;
	wire [31:0] memdata_o, memdata1;
	wire ALUSrc, RegDst, MemRead, MemWrite, MemtoReg;
	wire MemRead1, MemWrite1, MemtoReg1;
	wire MemtoReg2;
	
	

	PCregister PC(.In(PCin),.Out(PCout),.clk(clk),.reset(reset));
	
	ALUadd4 ALU4(.A(PCout),.B(B),.ALUout(PCin));

	inst_mem iMEM(.i_adr(PCout),.o_dat(IFIDin));

	IFIDregister IF(.In(IFIDin),.Out(IFIDout),.clk(clk),.reset(reset));
	
	controlLogic ctl( .lw(lw), .sw(sw), .beq(beq), .regWrite(regWrite), .In(IFIDout), .In1(IDEXin));
	
	regFile rFile(.Ip1(mux3_o), .sel_i1(mux2end), .Op1(Op1), .sel_o1(IFIDout [25:21]), .Op2(Op2), .sel_o2(IFIDout [20:16]),
	.RD(RD), .WR(regWrite3), .rst(reset), .EN(EN), .clk(clk));

	SignExtend ext(.In(IFIDout [15:0]),.Out(extendedin));

	IDEXregister ID(.Control_i(regWrite),.Op1_i(Op1),.Op2_i(Op2),.In(IFIDout),.Extended_i(extendedin),.clk(clk),
	.reset(reset),.Control_o(regWrite1),.Op1_o(Op1_o),.Op2_o(Op2_o),.Out(IDEXout),.Extended_o(extendedout),.ALUctl(),
	.ALUSrc(ALUSrc), .RegDst(RegDst), .MemRead(MemRead), .MemWrite(MemWrite), .MemtoReg(MemtoReg));

	Mux2to1_32bit M1(.i_bit1(Op2_o),.i_bit2(extendedout),.i_bitS(ALUSrc),.o_out(mux1_o));
	
	ALU_Control aluc( .In(IDEXout), .ALUOp(regWrite1), .Out(aluctl));
	
	Mux2to1_5bit M2(.i_bit1(IDEXout [15:11]),.i_bit2(IDEXout [20:16]),.i_bitS(RegDst),.o_out(mux2_o));

	ALU_32bit alu32(.ALUctl(aluctl),.A(Op1_o),.B(mux1_o),.ALUout(ALUout));

	EXMEMregister EX(.ALUout_i(ALUout),.Op2_i(Op2_o),.ALUout_o(ALUout_o),.Op2_o(Op2out),.RegDest_i(mux2_o),.RegDest_o(mux2out),
	.RegWrite(regWrite1),.regWrite(regWrite2),.clk(clk),.reset(reset), 
	.MemRead_i(MemRead), .MemWrite_i(MemWrite), .MemtoReg_i(MemtoReg), .MemRead_o(MemRead1), .MemWrite_o(MemWrite1), .MemtoReg_o(MemtoReg1));

	data_mem dMEM(.i_adr(ALUout_o), .i_dat(Op2out), .o_dat(memdata_o), .R(MemRead1), .W(MemWrite1));

	MEMWBregister WB(.dat1_i(memdata_o),.dat2_i(ALUout_o),.dat1_o(memdata1),.dat2_o(ALUout1),.RegDest_i(mux2out),.RegDest_o(mux2end),
	.RegWrite(regWrite2),.regWrite(regWrite3),.clk(clk),.reset(reset),.MemtoReg_i(MemtoReg1),.MemtoReg_o(MemtoReg2));

	Mux2to1_32bit M3(.i_bit1(memdata1),.i_bit2(ALUout1),.i_bitS(MemtoReg2),.o_out(mux3_o));



endmodule
