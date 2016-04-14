
`timescale 1ns/10ps


module receiver_tb();

	reg CLOCK_50;
	wire CLKOUTA;
	reg [15:0] DA;
	wire	PGA;
	wire	DITH;
	wire	RAND;
	wire	ENC;
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

	wire signed [19:0] sine2;
	wire signed [19:0] siness2;
	wire signed [19:0] sinesss2;
	cordic cx1
	(
	.clock(CLKOUTA), //130MHz
	.phase_inc(32'd48235787), //14.6 MHz, fir first non decimating
	.re(sinesss2),
	.im()
	);


	cordic cx
	(
	.clock(CLKOUTA), //130MHz
	.phase_inc(32'd28235787), //14.6 MHz, fir first non decimating
	.re(siness2),
	.im()
	);

	assign sine2 = siness2*sinesss2;


	wire signed [21:0] fir_first_data_out;
	wire fir_first_valid_out;
	wire [1:0] fir_first_error_out;
	fir_first f1
	(
		.clk              (CLKOUTA),
		.reset_n          (reset_n),
		.ast_sink_data    (sine2[19:4]),
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

/*
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


*/

	


initial
begin

	CLOCK_50=0;
	DA=0;

end



parameter clk_perios_ns = 20;


always
begin
#(clk_perios_ns/2);
CLOCK_50=~CLOCK_50;

end


always @(posedge CLKOUTA)
begin
	DA = $random;
end


endmodule
