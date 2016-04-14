
`timescale 1us/10ns

module dcf_signal_gen_tb();

parameter CLK_PERIOD_1_3MHz=0.769231us; //1,3MHz

reg clock_1_3MHz;
reg [58:0] time_data;
wire signed [15:0] signal;


initial
begin
	clock_1_3MHz=0;
	time_data = 59'b00001011001110100100100100001000000011101010000010101010001;
end


always
begin
	clock_1_3MHz=~clock_1_3MHz;
	#(CLK_PERIOD_1_3MHz/2);
end



dcf_signal_gen dcf_signal_gen_i1
(
	.clock(clock_1_3MHz),
	.time_data(time_data),

	.signal(signal)
);

wire pulse ;
assign pulse = dcf_signal_gen_i1.pulse;


endmodule




