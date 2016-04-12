
`timescale 1ns/100ps


module receiver_tb();

	reg CLOCK_50;
	reg CLOCK_130;
	wire CLKOUTA;
	reg signed [15:0] DA;
	wire PGA;
	wire DITH;
	wire RAND;
	wire ENC;
	wire [7:0] LED;
	wire [2:1] TX;



	wire fir_valid;
	wire [1:0] fir_error;

	assign	PGA = 0;
	assign	DITH = 0;
	assign	RAND = 0;
	assign	fir_valid = 1'd1;
	assign	fir_error = 2'd0;




	assign CLKOUTA = ENC;


	wire reset_n;
	reset_state rst1
	(
		.clock(CLKOUTA),
		.reset_n(reset_n)
	);

	/*
	pll_board pll1
	(
		.inclk0(CLOCK_50),
		.c0(ENC)
	);
	*/
	assign ENC = CLOCK_130;

	wire signed [19:0] sine77_5k;
	cordic c1
	(
	.clock(CLKOUTA), //130MHz
	.phase_inc(32'd364741838),
	.re(sine77_5k),
	.im()
	);


	/*
	wire signed [25:0] fir_first_data_out;
	wire fir_first_valid_out;
	wire [1:0] fir_first_error_out;
	fir_first f1
	(
		.clk              (CLKOUTA),
		.reset_n          (reset_n),
		.ast_sink_data    (sine77_5k[19:4]),
		.ast_sink_valid   (fir_valid),
		.ast_sink_error   (fir_error),
		.ast_source_data  (fir_first_data_out),
		.ast_source_valid (fir_first_valid_out),
		.ast_source_error (fir_first_error_out)
	);
*/
	wire signed [31:0] fir_second_data_out;
	wire fir_second_valid_out;
	wire [1:0] fir_second_error_out;
	fir_second f2
	(
		.clk              (CLKOUTA),
		.reset_n          (reset_n),
		.ast_sink_data    ({6'b0, sine77_5k}),
		.ast_sink_valid   (fir_valid),
		.ast_sink_error   (fir_error),
		.ast_source_data  (fir_second_data_out),
		.ast_source_valid (fir_second_valid_out),
		.ast_source_error (fir_second_error_out)
	);


initial
begin

	CLOCK_50=0;
	DA=0;
	CLOCK_130=0;

end



parameter clk_perios_ns = 769; //130MHz


always
begin
#(clk_perios_ns/2);
CLOCK_50=~CLOCK_50;
CLOCK_130=~CLOCK_130;

end


always @(posedge CLKOUTA)
begin
	DA = $random;
end


endmodule
