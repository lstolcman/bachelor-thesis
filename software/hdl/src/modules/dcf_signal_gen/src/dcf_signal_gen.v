
module dcf_signal_gen
(
	input clock,
	input [58:0] time_data,

	output reg signed [15:0] signal = 16'd0
);


wire pulse;
wire signed [19:0] re;
reg [19:0] clock_100ms_counter = 20'd0;
reg clock_100ms = 1'd0;

always @(posedge clock)
begin

	if (clock_100ms_counter >= 65000)
	begin
		clock_100ms_counter <= 0;
		clock_100ms <= ~clock_100ms;
	end
	else
		clock_100ms_counter <= clock_100ms_counter+1;

end


dcf_pulses_gen dcf_pulses_gen_i1
(
	.clock(clock_100ms),
	.time_data(time_data),

	.pulse(pulse)
);


cordic cordic_i1
(
	.clock(clock),
	.phase_inc(32'd256046127), // 77,5 kHz for 1,3MHz input clock
	.re(re),
	.im(),
	.re_u(),
	.im_u()
);


always @(posedge clock)
begin

	if (pulse == 1)
	begin
		signal <= re[19:4];
	end
	else
	begin 
		// http://stackoverflow.com/questions/14197117/arithmetic-shift-acts-as-a-logical-shift-regardless-of-the-signed-variable
		// once you take a part-select, the result is unsigned
		//signal <= {{3{re[19]}}, re[19:7]};
		signal <= $signed(re[19:4])>>>3;
	end

end


endmodule

