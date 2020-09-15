`timescale 1ns / 1ps

module main_MIPS_32b(
		input clock,
		output reg [31:0] instruction,
		output reg [31:0] ReadReg1,
		output reg [31:0] ReadReg2,
		output reg [31:0] ALU_oout,
		output reg [31:0] MemData,
		output reg [31:0] M3outt,
		output reg [4:0] M1outt,
		output reg zero,
		output reg [4:0] r1,
		output reg [4:0] r2,
		output reg [31:0] current_PC

);

// instantiating wires

wire [31:0] PC_out;
wire [31:0] instructionOutW;
wire [4:0] M1out;
wire [31:0] ReadReg1w;
wire [31:0] ReadReg2w;
wire [31:0] ALUout;
wire [31:0] signExtW;
wire [31:0] MemDataOutW;
wire [31:0] M2out;
wire [31:0] M3out;

wire zeroW;
wire [2:0] ALUcontrolW;

wire RegDstW;
wire JumpW;
wire BranchW;
wire MemReadW;
wire MemtoRegW;
wire [1:0] ALUOpW;
wire MemWriteW;
wire ALUSrcW;
wire RegWriteW;

wire [31:0] shiftby2_32w;
wire [31:0] shift_adder;
wire [31:0] M4out;
wire [31:0] M5out;

wire andOut;

wire [27:0] shiftby2_26w;

wire [31:0] ja;


// instantiating registers
reg [31:0] PC = 32'b0;

// instantiating hardware modules

adder_4 PCadder(PC,PC_out);

instMemory IM(PC,instructionOutW);

Mux2x1 MUX1(instructionOutW[20:16], instructionOutW[15:11], RegDstW, M1out);

RegisterFile RF(instructionOutW[25:21], instructionOutW[20:16], M1out, M3out, RegWriteW, ReadReg1w, ReadReg2w);

signExtension SE(signExtW, instructionOutW[15:0]);

DataMemory DM(ALUout, MemDataOutW);

Mux2x1_32b M2(ReadReg2w, signExtW, ALUSrcW, M2out);

Mux2x1_32b M3(ALUout,MemDataOutW, MemtoRegW, M3out);

ALU ALUU(ReadReg1w, M2out, ALUcontrolW, ALUout, zeroW);

ALUControl ALUC(ALUcontrolW,  ALUOpW, instructionOutW[5:0]);

ControlUnit CU1(instructionOutW[31:26], RegDstW, JumpW, BranchW, MemReadW, MemtoRegW, ALUOpW, MemWriteW, ALUSrcW, RegWriteW);

shiftby2_32b s32(signExtW, shiftby2_32w);

adder_32b add32(shiftby2_32w, PC_out, shift_adder);

and_gate ag(BranchW, zeroW, andOut);

Mux2x1_32b M4(PC_out, shift_adder, andOut, M4out);

Mux2x1_32b M5(M4out, ja, JumpW, M5out);

shiftby2_26b s26(instructionOutW[25:0], shiftby2_26w);

jump_concat jc(shiftby2_26w, PC[31:28], ja);


// code

always @ (posedge clock)

begin

	PC = M5out;
	instruction = instructionOutW;
	ReadReg1 = ReadReg1w;
	ReadReg2 = ReadReg2w;
	ALU_oout = ALUout;
	MemData = MemDataOutW;
	M3outt = M3out;
	M1outt = M1out;
	zero = zeroW;
	r1 = instructionOutW[25:21];
	r2 = instructionOutW[20:16];
	current_PC = PC_out-4;
	
end

endmodule
