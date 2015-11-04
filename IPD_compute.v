`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:53 11/04/2015 
// Design Name: 
// Module Name:    IPD_compute 
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
module IPD_compute(clk, rst, compute, ik, yk, dk, acc);
	input clk, rst, compute;            // compute para q calcule la accion total del ipd cuando asi se le pida
	input signed [16:0] ik;
	input signed [8:0] yk;
	input signed [18:0] dk;
	output reg [18:0] acc;              // accion total del i_pd, salida del i_pd
	
localparam signed [6:0] KP = 7'd36;

always @ (posedge clk)
	if (rst)
		acc = 19'b0;
	else begin
		if (compute)
			acc = (ik - (yk * KP) - dk);  // calculo de la salida del i_pd cuando asi se le solicite
		else 
			acc = acc;                    // se mantiene el valor de acc anterior si no llega la señal de control para realizar un nuevo calculo
	end

endmodule
