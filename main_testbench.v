`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:06:19 09/13/2020
// Design Name:   main_MIPS_32b
// Module Name:   C:/Users/ninja/Desktop/MIPS32bit_Project/mipstest.v
// Project Name:  MIPS32bit_Project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main_MIPS_32b
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mipstest;

	// Inputs
	reg clock;

	// Outputs
	wire [31:0] instruction;
	wire [31:0] ReadReg1;
	wire [31:0] ReadReg2;
	wire [31:0] ALU_oout;
	wire [31:0] MemData;
	wire [31:0] M3outt;
	wire [4:0] M1outt;
	wire zero;
	wire [4:0] r1;
	wire [4:0] r2;
	wire [31:0] current_PC;

	// Instantiate the Unit Under Test (UUT)
	main_MIPS_32b uut (
		.clock(clock), 
		.instruction(instruction), 
		.ReadReg1(ReadReg1), 
		.ReadReg2(ReadReg2), 
		.ALU_oout(ALU_oout), 
		.MemData(MemData), 
		.M3outt(M3outt), 
		.M1outt(M1outt), 
		.zero(zero), 
		.r1(r1), 
		.r2(r2), 
		.current_PC(current_PC)
	);

	initial begin
		// Initialize Inputs
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		forever #50 clock=~clock;
	end
      
endmodule

