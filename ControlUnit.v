`timescale 1ns / 1ps

module ControlUnit(
    input [5:0] opcode,
    output reg RegDst,
    output reg Jump,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg [1:0] ALUop,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
    );


always@(opcode)

begin
	case(opcode)
	
	// r type
	6'b000000: 
		begin
		RegDst = 1'b1;
		Jump = 1'b0;
		Branch = 1'b0;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		ALUop = 2'b10;
		MemWrite = 1'b0;
		ALUSrc = 1'b0;
		RegWrite = 1'b1;
		end
	
	// beq
	6'b000100: 
		begin
		RegDst = 1'b0;	//x
		Jump = 1'b0;
		Branch = 1'b1; 
		MemRead = 1'b0;
		MemtoReg = 1'b0;	//x
		ALUop = 2'b01;
		MemWrite = 1'b0;
		ALUSrc = 1'b0;
		RegWrite = 1'b0;
		end
		
	// lw
	6'b100011:
		begin
		RegDst = 1'b0;
		Jump = 1'b0;
		Branch = 1'b0;
		MemRead = 1'b1;
		MemtoReg = 1'b1;
		ALUop = 2'b00;
		MemWrite = 1'b0;
		ALUSrc = 1'b1;
		RegWrite = 1'b1;
		end
	
	//sw
	6'b101011: 
		begin
		RegDst = 1'bx; //x
		Jump = 1'b0;
		Branch = 1'b0;
		MemRead = 1'b0;
		MemtoReg = 1'bx; //x
		ALUop = 2'b00;
		MemWrite = 1'b1;
		ALUSrc = 1'b1;
		RegWrite = 1'b0;
		end
			
	// addi
	6'b001000: 
		begin
		RegDst = 1'b0;
		Jump = 1'b0;
		Branch = 1'b0;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		ALUop = 2'b00;
		MemWrite = 1'b0;
		ALUSrc = 1'b1;
		RegWrite = 1'b1;
		end
		
	// jump
	6'b000010: 
		begin
		RegDst = 1'b0;
		Jump = 1'b1;
		Branch = 1'b0;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		ALUop = 2'b00;
		MemWrite = 1'b0;
		ALUSrc = 1'b0;
		RegWrite = 1'b0;
		end
		
	endcase
				
end

endmodule
