`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:24:43 03/18/2021 
// Design Name: 
// Module Name:    regFile 
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
module regFile( Ip1, sel_i1, Op1, sel_o1, Op2, sel_o2, RD, WR, rst, EN, clk );      

input  [31:0]  Ip1; 

reg [31:0] temp1 [31:0];

input  [4:0]  sel_i1, sel_o1, sel_o2; 

input  RD,WR; 

input  EN, clk, rst; 

output [31:0]  Op1, Op2;     

reg [31:0]  regFile [31:0]; 

integer i; 

assign Op1 = regFile [sel_o1];
assign Op2 = regFile [sel_o2];


always @ (posedge clk, negedge clk, posedge rst) 

begin 

 if (EN == 1) 

 begin 

  if (rst == 1) //If at reset 

   begin 

  regFile [0] = 32'h0;
  
	
	for (i = 0; i < 31; i = i + 1) begin
    
	temp1 [i] = 0; 
	end
	

   for (i = 1; i < 32; i = i + 1) begin
    
	regFile [i] = i + 5; 

   end  

   end 

  else if (~clk && WR) 

   begin 
	
	regFile [sel_i1] = Ip1;
	
	end
//	else if (~clk && WR)
//	begin
//	regFile [sel_i1] = temp1 [sel_i1];
//	end
	
//   case ({RD,WR}) 
//
//    2'b00:  begin 
//
//     end 
//
//    2'b01:  begin //If Write only 
//
//     regFile [sel_i1] = Ip1; 
//
//     end 
//
//    2'b10:  begin //If Read only 
//
//     Op1 = regFile [sel_o1]; 
//
//     Op2 = regFile [sel_o2]; 
//
//     end 
//
//    2'b11:  begin //If both active 
//
//     Op1 = regFile [sel_o1]; 
//
//     Op2 = regFile [sel_o2]; 
//
//     regFile [sel_i1] = Ip1; 
//
//     end 

//    default: begin //If undefined 
//
//      end 
//
//   endcase 

   end 

end


endmodule