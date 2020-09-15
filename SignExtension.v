`timescale 1ns / 1ps

module signExtension(
	output reg [31:0] out,
	input [15:0] in
    );
	 
always@(in) 
			begin
				if (in[15]==1)
					begin
						out <= {16'hffff , in};
					end
				else 
					begin
						out <= in;
					end
			end
endmodule
