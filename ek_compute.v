`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:14 11/04/2015 
// Design Name: 
// Module Name:    ek_compute 
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
module ek_compute(clk, rst, compute, referencia, yk, ek);
	input clk, rst, compute;           // compute es para indicar q haga el calculo de ek, osea como un enable 
	input signed [7:0] referencia;     // 8bits de referencia q le metemos nosotros con los switches
	input signed [8:0] yk;             // yk calculado de otro módulo, son 9bits xq se tiene q meter el signo 
	output reg [8:0] ek;               // igual aca son 9bits por el signo
	
always @ (posedge clk)
	if (rst)
		ek = 9'b0;
	else begin
		if (compute)
			ek = referencia - yk;        // Determina el error e inicia el calculo del regulador PID
		else 
			ek = ek;                     // si no se debe hacer el calculo del error, el ek permanece con el valor anterior
	end

endmodule
