`timescale 1ns / 1ps

module instMemory(
	input[31:0]  address,      // Input Address 
	output[31:0]  instruction
    );
reg [31:0] mem[1023:0];
initial
	begin
		$readmemh("runningInstruction.txt",mem);
	end
	assign instruction = mem[address>>2];	
endmodule
