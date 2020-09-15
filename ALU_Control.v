`timescale 1ns / 1ps


module ALUControl( ALU_Control, ALUOp, Function);
  
 output reg[2:0] ALU_Control;  
 input [1:0] ALUOp;  
 input [5:0] Function;  
 //input clock;
 
 wire [7:0] ALUControlIn;  
 assign ALUControlIn = {ALUOp,Function};  
 
always @(ALUControlIn)  
	 casex (ALUControlIn)  
	  8'b10100100: ALU_Control=3'b000;  
	  8'b10100101: ALU_Control=3'b001;  
	  8'b10100000: ALU_Control=3'b010;  
	  8'b10100010: ALU_Control=3'b110;  
	  8'b10101010: ALU_Control=3'b111;  
	  8'b00xxxxxx: ALU_Control=3'b010;  
	  8'b01xxxxxx: ALU_Control=3'b110;  
	  default: ALU_Control=3'b000;  
	  endcase  
	  
 endmodule  
