`timescale 1ns/1ps
module goertzel_q0_test_tb();

parameter CLK_PERIOD=7.692; //130MHz
parameter CLK_PERIOD_sample=769.2; //1.3MHz


reg clock;
reg clock_sample;
reg signed [31:0] sample;
wire ready;
wire [63:0] power;


reg [20:0] i;
reg [31:0] memory [0:5199];



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


	if (i >= 520)
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












wire signed [31:0] q0int;
fp64int32conv fp64int32conv_i1_q0
(
	.aclr(1'b0),
	.clock(clock),
	.dataa(i1.q0),
	.result(q0int)
);


wire signed [31:0] q1int;
fp64int32conv fp64int32conv_i1_q1
(
	.aclr(1'b0),
	.clock(clock),
	.dataa(i1.q1),
	.result(q1int)
);

wire signed [31:0] q2int;
fp64int32conv fp64int32conv_i1_q2
(
	.aclr(1'b0),
	.clock(clock),
	.dataa(i1.q2),
	.result(q2int)
);



wire signed [31:0] q0int_tmp;
fp64int32conv fp64int32conv_i1_q0_tmp
(
	.aclr(1'b0),
	.clock(clock),
	.dataa(i1.q0_tmp),
	.result(q0int_tmp)
);


wire signed [31:0] q1int_tmp;
fp64int32conv fp64int32conv_i1_q1_tmp
(
	.aclr(1'b0),
	.clock(clock),
	.dataa(i1.q1_tmp),
	.result(q1int_tmp)
);

wire signed [31:0] q2int_tmp;
fp64int32conv fp64int32conv_i1_q2_tmp
(
	.aclr(1'b0),
	.clock(clock),
	.dataa(i1.q2_tmp),
	.result(q2int_tmp)
);









endmodule

