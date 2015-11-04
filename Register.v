`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:17:49 11/04/2015 
// Design Name: 
// Module Name:    Register 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Register(clk, rst, save, yk, ik, yk1, ik1);
	input clk, rst, save;   
	input signed [8:0] yk;
	input signed [16:0] ik;
	output reg [8:0] yk1;
	output reg [16:0] ik1;
	
always @ (posedge clk)
	if (rst) begin
		yk1 <= 9'b0;
		ik1 <= 17'b0;
	end
	else begin
		if (save) begin             
			yk1 <= yk;
			ik1 <= ik;
		end
		else begin
			yk1 <= yk1;
			ik1 <= ik1;
		end
	end
	
endmodule
