`timescale 1ns / 1ps

module adder_32b(
    input [31:0] op1,
    input [31:0] op2,
    output reg [31:0] result
    );

always@(*)
	begin
		assign result = op1+op2;
	end

endmodule
