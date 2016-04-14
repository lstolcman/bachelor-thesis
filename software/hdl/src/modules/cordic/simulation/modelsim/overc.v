//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       James C. Ahlstrom
// 
// Create Date:    12:31:22 5/2/2007
// Design Name:    Cordic Module
// Module Name:    cordic1
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 17 Aug 2009
// Revision 0.02 - Modified for real input, complex output
// Additional Comments: 
//   VNA features added January 2012.
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module overc_tb();
/*

	input signed [13:0] adc_data,		// real input data from ADC, 14 bits
	input wire clk,						// master clock
	input wire [31:0] delta,			// tuning word
	output signed [17:0] re,			// complex result, 18 bits
	output signed [17:0] im,
	output reg signed [13:0] rf_ref);		// reference RF sine wave used by receiver

*/
	parameter clk_period_ns = 20;

	reg clk;
	reg [31:0] delta;

	wire signed [19:0] re;
	wire signed [19:0] im;
	wire signed [19:0] re_u;
	wire signed [19:0] im_u;

	wire [19:0] s;
	wire [5:0] s2;
	wire [5:0] s3;
	wire [5:0] s4;
	assign s = im[19] ? im-2**19: im+2**19;
	assign s2 = s[5:0];
	assign s3=s[19:14];
	assign s4=im_u[19:14];

	cordic c1
	(
		.clock(clk),
		.phase_inc(delta),
		.re(re),
		.im(im),
		.re_u(re_u),
		.im_u(im_u)
	);

reg [19:0] memoryout[9999:0];
reg wr;
integer inc;

	initial
	begin
		clk = 0;
		delta = 0;
		wr=0;
		inc=0;
#100;
		delta = 6657199;//19327352;
#1us;
wr=1;
#100us;
$writememb("dataout.txt", memoryout);
	end

	always
	begin
#(clk_period_ns/2);
		clk = ~clk;
	end


	always @(posedge clk)
	begin
	if (wr)
		begin
			memoryout[inc]=re;
			inc=inc+1;
		end


	end



endmodule
