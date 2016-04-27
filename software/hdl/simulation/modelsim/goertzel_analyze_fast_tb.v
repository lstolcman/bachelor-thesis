
`timescale 1ms/1us

module goertzel_analyze_fast_tb();

parameter CLK_PERIOD=100ms; // 10Hz
parameter CLK_PERIOD2k5=0.400ms; //2,5kHz

// clock2k5 - every 400us goertzel gives us an result
//
reg clock;
reg clock2k5;
reg [58:0] time_data;

reg [15:0] memory [0:179900];

integer i;

initial
begin
	i=0;
	clock=0;
	clock2k5=0;
	time_data = 59'b00001011001110100100100100001000000011101010000010101010001;
	dcf_pulses_gen_i1.bit_position=54;
end

always
begin
	clock=~clock;
	#(CLK_PERIOD/2);
end

always
begin
	clock2k5=~clock2k5;
	#(CLK_PERIOD2k5/2);
end


dcf_pulses_gen dcf_pulses_gen_i1
(
	.clock(clock),
	.time_data(time_data),

	.pulse(pulse)
);


always @(posedge clock2k5)
begin
	if (pulse == 0)
		memory[i] = 21;
	else
		memory[i] = 1475;

	if (i == 179900)
		$writememh("goertzel_analyze_fast.txt", memory);

	i = i+1;

end


endmodule




