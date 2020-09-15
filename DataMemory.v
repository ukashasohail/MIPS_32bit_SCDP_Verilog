`timescale 1ns / 1ps

module DataMemory(
	input[31:0]  address,      // Input Address 
	output[31:0]  data
    );
reg [31:0] mem[1023:0];
initial
	begin
		$readmemh("datamemory.txt",mem);
	end
	assign data = mem[address>>2];	
endmodule
