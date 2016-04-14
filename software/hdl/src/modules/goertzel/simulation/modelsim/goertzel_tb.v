`timescale 1ns/1ps
module goertzel_tb();

parameter CLK_PERIOD=7.692; //130MHz
parameter CLK_PERIOD_sample=769.2; //1.3MHz


reg clock;
reg clock_sample;
reg signed [31:0] sample;
wire ready;
wire [63:0] power;


reg [20:0] i;
reg [31:0] memory [0:13599];



////////////////


initial
begin
	$readmemh("sine.txt", memory);
	i = 0;
	clock = 0;
	clock_sample = 0;
	sample = 0;
end

always
begin
	clock=~clock;
	#(CLK_PERIOD/2);
end

always
begin
	clock_sample=~clock_sample;
	#(CLK_PERIOD_sample/2);
end

always @(posedge clock_sample)
begin
	i = i+1;

	if (i >= 13600)
		i = 0;

	sample = memory[i];
end


//////////////////////////////////////////////////////////


goertzel i1
(
	.clock(clock), //130MHz
	.clock_sample(clock_sample), //1,3MHz
	.sample(sample),

	.ready(ready),
	.power(power)
);

wire [64:0] power_div;
assign power_div = power>>35;







endmodule

