`timescale 1ns / 1ps

module shiftby2_32b(
    input [31:0] data_in,
    output reg [31:0] data_out
    );

always @(*)
	begin

		assign data_out = data_in << 2;

	end
endmodule
