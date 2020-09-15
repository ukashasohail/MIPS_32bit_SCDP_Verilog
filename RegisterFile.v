`timescale 1ns / 1ps

module RegisterFile(
    input [4:0] ReadReg1,
    input [4:0] ReadReg2,
    input [4:0] WriteReg,
    input [31:0] WriteData,
    input RegWrite,
    output reg [31:0] ReadData1,
    output reg [31:0] ReadData2
    );

reg [31:0] rf[31:0];

always@(*)

	begin		

		if(RegWrite)
			rf[WriteReg] <= WriteData;
		
		if(ReadReg1 == 5'b000)
			ReadData1 <= 32'b0;
		else
			ReadData1 <= rf[ReadReg1];

		if(ReadReg2 == 5'b000)
			ReadData2 <= 32'b0;
		else
			ReadData2 <= rf[ReadReg2];	
	end

endmodule