`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:59 11/04/2015 
// Design Name: 
// Module Name:    dk_compute 
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
module dk_compute(clk, rst, compute, yk, yk1, dk);
	input clk, rst, compute;            // compute para indicar cuando se debe realizar el nuevo calculo de dk
	input signed [8:0] yk, yk1;         // yk actual y yk1 es el anterior, ambos de 9bits xq hay q considerar el signo
	output reg [18:0] dk;               

localparam signed [9:0] KD = 10'd300;  // variable KD

always @ (posedge clk)
	if (rst)
		dk = 19'b0;
	else begin
		if (compute)
			dk = (KD * (yk - yk1));       // porcion derivada actuando sobre la realimentacion de posicion
		else
			dk = dk;                      // no cambia si no se le indica lo contrario
	end


endmodule