
`timescale 1ns/10ps


module receiver_tb();

reg CLOCK_50;
reg CLOCK_130;
reg CLOCK_1_3;
reg CLOCK_115200;
wire CLKOUTA;
assign CLKOUTA = CLOCK_130;
reg signed [15:0] DA;
wire ENC;
wire TX[2:1];

reg [20:0] i;
reg signed [15:0] memory [0:12999];

receiver receiver_i1
(
	.CLOCK_50(CLOCK_50),
	.CLKOUTA(CLKOUTA),
	.DA(DA),
	.PGA(),
	.DITH(),
	.RAND(),
	.ENC(),
	.TX(TX)

	/*
	input			CLOCK_50,
	input			CLKOUTA,
	input signed	[15:0] DA,
	output			PGA,
	output			DITH,
	output			RAND,
	output			ENC,
	output			TX
	*/
);


wire ready;
wire unsigned [63:0] power;
goertzel goertzel_i1
(
	.clock(CLOCK_130),
	.clock_sample(CLOCK_1_3),
	.sample({16'd0, DA}),
	.ready(ready),
	.power(power)
	/*
	input clock, //130MHz
	input clock_sample, //1,3MHz
	input reset_n,
	input signed [31:0] sample,

	output reg ready,
	output reg [63:0] power
	*/
);



initial
begin
	i = 0;
	$readmemh("sine.txt", memory);


	CLOCK_50 = 1'd0;
	CLOCK_130 = 1'd0;
	CLOCK_1_3 = 1'd0;
	CLOCK_115200 = 1'd0;
	DA = 16'd0;


end



parameter clk50_period_ns = 20ns; //50MHz
always
begin
#(clk50_period_ns/2);
CLOCK_50=~CLOCK_50;
end

parameter clk130_period_ns = 7.692ns; //130MHz
always
begin
#(clk130_period_ns/2);
CLOCK_130=~CLOCK_130;
end

parameter clk1_3_period_ns = 769.231ns; //1,3MHz
always
begin
#(clk1_3_period_ns/2);
CLOCK_1_3=~CLOCK_1_3;
end

parameter clk115200_period_ns = 8680.555ns; //115,2kHz
always
begin
#(clk115200_period_ns/2);
CLOCK_115200=~CLOCK_115200;
end

always @(posedge CLOCK_130)
begin
	DA = memory[i];
	i <= i+1;
	if (i >= 5199)
		i <= 0;
end


endmodule
