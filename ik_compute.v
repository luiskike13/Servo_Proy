`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:30:29 11/04/2015 
// Design Name: 
// Module Name:    ik_compute 
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
module ik_compute(clk, rst, compute, ek, ik1, ik);
	input clk, rst, compute;         // compute es para indicar cuando se tiene q hacer este calculo de ik
	input signed [8:0] ek;           // recibe ek 
	input signed [16:0] ik1;			// ik1 es el ik anterior, el cual estar guardado en un registro
	output reg [16:0] ik;            
	
localparam signed [4:0] KI = 5'd14; // variable IK

always @ (posedge clk) 
	if (rst)
		ik = 17'b0;
	else begin
		if (compute)
			ik = ((KI * ek) + ik1);    // calculo de la porcion integral
		else
			ik = ik;                   // se mantiene igual si no se le pide realizar un calculo nuevo de ik
	end

endmodule
