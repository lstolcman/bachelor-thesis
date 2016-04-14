
`timescale 1ms/1ms

module dcf_pulses_gen_tb();

parameter CLK_PERIOD=100ms;

reg clock;
reg [58:0] time_data;
wire pulse;


initial
begin
	clock=0;
	time_data = 59'b00001011001110100100100100001000000011101010000010101010001;
	dcf_pulses_gen_i1.bit_position=54;
end

always
begin
	clock=~clock;
	#(CLK_PERIOD/2);
end


dcf_pulses_gen dcf_pulses_gen_i1
(
	.clock(clock),
	.time_data(time_data),

	.pulse(pulse)
);



endmodule




