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
// CREATED		"Tue Mar 22 14:28:25 2016"

module receiver
(
	input			CLOCK_50,
	input			CLKOUTA,
	input signed	[15:0] DA,
	output			PGA,
	output			DITH,
	output			RAND,
	output			ENC,
	output			[7:0] LED,
	output			[2:1] TX
);


	wire fir_valid;
	wire [1:0] fir_error;

	assign	PGA = 0;
	assign	DITH = 0;
	assign	RAND = 0;
	assign	fir_valid = 1'd1;
	assign	fir_error = 2'd0;
	
	assign TX[1] = 1;

	reg [15:0] reg_adc_data;


	wire reset_n;
	reset_state rst1
	(
		.clock(CLKOUTA),
		.reset_n(reset_n)
	);



	pll_board pll1
	(
		.inclk0(CLOCK_50),
		.c0(ENC)
	);



	wire pll_uart_out;
	pll_uart pll2
	(
		.inclk0(CLOCK_50),
		.c0(pll_uart_out)
	);



	always @(posedge CLKOUTA)
	begin
		reg_adc_data <= DA;
	end


	wire signed [21:0] fir_first_data_out;
	wire fir_first_valid_out;
	wire [1:0] fir_first_error_out;
	fir_first f1
	(
		.clk              (CLKOUTA),
		.reset_n          (reset_n),
		.ast_sink_data    (reg_adc_data),
		.ast_sink_valid   (fir_valid),
		.ast_sink_error   (fir_error),
		.ast_source_data  (fir_first_data_out),
		.ast_source_valid (fir_first_valid_out),
		.ast_source_error (fir_first_error_out)
	);


	wire signed [19:0] sine;
	cordic c1
	(
	.clock(fir_first_valid_out), //2MHz
	.phase_inc(32'd483183821),
	.re(sine),
	.im()
	);

	reg signed [21:0] reg_mult;
	always @(posedge fir_first_valid_out)
	begin
		reg_mult <= fir_first_data_out * sine;
	end

	wire signed [31:0] fir_second_data_out;
	wire fir_second_valid_out;
	wire [1:0] fir_second_error_out;
	fir_second f2
	(
		.clk              (fir_first_valid_out),
		.reset_n          (reset_n),
		.ast_sink_data    (reg_mult),
		.ast_sink_valid   (fir_valid),
		.ast_sink_error   (fir_error),
		.ast_source_data  (fir_second_data_out),
		.ast_source_valid (fir_second_valid_out),
		.ast_source_error (fir_second_error_out)
	);



	wire uart_done;
	uart u1
	(
		.clock(pll_uart_out),
		.reset_n(reset_n),
		.send(fir_second_valid_out),
		.done(uart_done),
		.data(fir_second_data_out[15:8]),
		.tx(TX[2])
	);





endmodule
