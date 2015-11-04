`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:18:55 11/04/2015 
// Design Name: 
// Module Name:    yk_compute 
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

module yk_compute(clk, rst, compute, POT, yk);
	input clk, rst, compute;          // compute es para indicarle cuando hacer el nuevo calculo de yk
	input [7:0] POT;                  // Señal q viene del servo, 8bits de la posicion actual del motor
	output reg [8:0] yk;              // 9bits de yk xq hay q considerar el signo

localparam [8:0] var = 9'd128;       // para ajustar la variable al rango de -2V a +2V

always @ (posedge clk)
	if (rst)
		yk = 9'b0;
	else begin
		if (compute)
			yk = POT - var;             // calculo de yk solo si asi se le indica
		else
			yk = yk;                    // yk permanece igual si no se da la señal de q debe ser calculada de nuevo
	end

endmodule