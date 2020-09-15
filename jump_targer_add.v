`timescale 1ns / 1ps

module jump_concat(
    input [27:0] ins_28b,
    input [3:0] pc_plus4,
    output reg [31:0] jump_address
    );

always @(*)
	begin

		assign jump_address = {pc_plus4, ins_28b};

	end
	

endmodule
