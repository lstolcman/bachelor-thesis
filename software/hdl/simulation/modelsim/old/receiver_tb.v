
`timescale 1ns/100ps


module receiver_tb();

	reg CLOCK_50;
	wire CLKOUTA;
	wire ENC;
	assign CLKOUTA=ENC;
	reg signed [15:0] DA;
	wire [2:1] TX;

	receiver receiver_i1
	(
		.CLOCK_50(CLOCK_50),
		.CLKOUTA(CLKOUTA),
		.DA(DA),
		.PGA(),
		.DITH(),
		.RAND(),
		.ENC(ENC),
		.LED(),
		.TX(TX)
		/*
		input			CLOCK_50,
		input			CLKOUTA,
		input signed	[15:0] DA,
		output			PGA,
		output			DITH,
		output			RAND,
		output			ENC,
		output			[7:0] LED,
		output			[2:1] TX
		*/
	);

initial
begin

	CLOCK_50=0;
	DA=0;

end



parameter clk_period_ns = 20; //130MHz

always
begin
#(clk_period_ns/2);
CLOCK_50=~CLOCK_50;
end


always @(posedge CLKOUTA)
begin
	DA = $random;
end


endmodule
