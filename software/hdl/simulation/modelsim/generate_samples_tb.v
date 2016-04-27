
`timescale 1us/10ns

module generate_samples_tb();

parameter CLK_PERIOD_1_3MHz=0.769231us; //1,3MHz

reg clock_1_3MHz;
reg [58:0] time_data;
wire signed [15:0] signal;


reg signed [15:0] memory [0:2999999];

integer i;
initial
begin
	i=0;
	clock_1_3MHz=0;
	time_data = 59'b01001011001110100100100100001000000011101010000010101010001;
end


always
begin
	clock_1_3MHz=~clock_1_3MHz;
	#(CLK_PERIOD_1_3MHz/2);
end


always @(posedge clock_1_3MHz)
begin
	if (signal != "x")
	begin
		memory[i] = signal;
		i = i+1;
	end

	if (i == 3000000)
		$writememh("generate_samples_out.txt", memory);
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




