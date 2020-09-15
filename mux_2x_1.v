`timescale 1ns / 1ps

module Mux2x1(
    input [4:0] I0,
    input [4:0] I1,
    input sel,
    output reg [4:0] out
    );

always @ (*)
begin
	if(sel)
		out = I1;
	else
		out = I0;
end

endmodule
