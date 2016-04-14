
module receiver
(
	input			CLOCK_50,
	input			CLKOUTA,
	input signed	[15:0] DA,
	output			PGA,
	output			DITH,
	output			RAND,
	output			ENC,
	output			TX[2:1]
);



	wire fir_valid;
	assign	fir_valid = 1'd1;
	wire [1:0] fir_error;
	assign	fir_error = 2'd0;



	assign	PGA = 0;
	assign	DITH = 0;
	assign	RAND = 0;
	
	reg [15:0] reg_adc_data = 16'd0;


	wire reset_n;
	reset_state reset_state_i1
	(
		.clock(CLKOUTA),
		.reset_n(reset_n)
	);


	
	/*
	pll_board pll_board_i1
	(
		.inclk0(CLOCK_50),
		.c0(ENC)
	);


	wire pll_uart_out;
	pll_uart pll_uart_i1
	(
		.inclk0(CLOCK_50),
		.c0(pll_uart_out)
	);

*/

	always @(posedge CLKOUTA)
	begin
		reg_adc_data <= DA;
	end


	wire signed [22:0] fir_first_data_out;
	wire fir_first_valid_out;
	wire [1:0] fir_first_error_out;
	fir_first fir_first_i1
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


	/*
	wire signed [19:0] sine;
	cordic cordic_i1
	(
	.clock(fir_first_valid_out), //2MHz
	.phase_inc(32'd483183821),
	.re(sine),
	.im(),
	.re_u(),
	.im_u()
	);


	reg signed [25:0] reg_mult;
	always @(posedge fir_first_valid_out)
	begin
		reg_mult <= fir_first_data_out * sine;
	end

	wire signed [31:0] fir_second_data_out;
	wire fir_second_valid_out;
	wire [1:0] fir_second_error_out;
	fir_second fir_second_i1
	(
		.clk              (CLKOUTA),
		.reset_n          (reset_n),
		.ast_sink_data    (reg_mult),
		.ast_sink_valid   (fir_valid),
		.ast_sink_error   (fir_error),
		.ast_source_data  (fir_second_data_out),
		.ast_source_valid (fir_second_valid_out),
		.ast_source_error (fir_second_error_out)
	);
	*/
	wire signed [31:0] gin= {{9{fir_first_data_out[22]}}, fir_first_data_out};
	wire ready;
	wire [63:0] power;
	goertzel goertzel_i1
	(
		.clock(CLKOUTA), //130MHz
		.clock_sample(fir_first_valid_out), //1,3MHz
		.sample(gin),

		.ready(ready),
		.power(power)
		
		//input clock, //130MHz
		//input clock_sample, //1,3MHz
		//input signed [31:0] sample,
		//output reg ready = 1'd0,
		//output reg [63:0] power = 64'd0
		
	);

/*
	wire uart_done;
	uart uart_i1
	(
		.clock(pll_uart_out),
		.reset_n(reset_n),
		.send(ready),
		.done(),
		.data(power[45:38]),
		.tx(TX[2])
	);

	*/



endmodule

