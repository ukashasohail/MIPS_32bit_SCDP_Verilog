`timescale 1ns / 1ps

module shiftby2_26b(
    input [25:0] data_in,
    output reg [27:0] data_out
    );

always @(*)
	begin

		assign data_out = data_in << 2;

	end
	
endmodule
