// Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus Prime License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 15.1.0 Build 185 10/21/2015 SJ Lite Edition"
// CREATED		"Thu Mar 17 16:17:49 2016"

module testfir1(
	clk,
	reset_n,
	validin,
	din,
	ei,
	validout,
	do,
	eo
);


input wire	clk;
input wire	reset_n;
input wire	validin;
input wire	[7:0] din;
input wire	[1:0] ei;
output wire	validout;
output wire	[21:0] do;
output wire	[1:0] eo;






fir1	b2v_inst(
	.clk(clk),
	.reset_n(reset_n),
	.ast_sink_valid(validin),
	.ast_sink_data(din),
	.ast_sink_error(ei),
	.ast_source_valid(validout),
	.ast_source_data(do),
	.ast_source_error(eo));


endmodule
