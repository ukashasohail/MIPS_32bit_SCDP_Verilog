`timescale 1ns / 1ps

module adder_4(
    input [31:0] inst_address,
    output reg [31:0] inst_address_plus4
    );
	 
reg [31:0] aux;

always@(*)
begin
assign aux = inst_address + 4;
assign inst_address_plus4 = aux;
end
endmodule
