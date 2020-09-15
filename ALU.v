`timescale 1ns / 1ps

module ALU(
		input [31:0]  regA,          //src1  
      input [31:0]  regB,          //src2  
      input [2:0]   alu_control,		//function sel  
		//input clock,
      output reg [31:0]  result,          //result       
      output zero
    );
always @(*) 
 begin   
      casex(alu_control)  
      3'b000: result = regA & regB; // add  
      3'b001: result = regA | regB; // sub  
      3'b010: result = regA + regB; // and  
      3'b110: result = regA - regB; // or  
      3'b111: begin if (regA < regB) result = 32'd1;  
                     else result = 32'd0;  
                     end  
      default:result = regA + regB; // add  
      endcase  
 end  
 assign zero = (result == 32'd0) ? 1'b1: 1'b0;  
 
 endmodule
