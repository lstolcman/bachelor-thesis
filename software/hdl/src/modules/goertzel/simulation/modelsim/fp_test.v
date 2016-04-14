`timescale 1ns/1ps
module fp_test_tb();

parameter CLK_PERIOD=7.692; //130MHz
parameter CLK_PERIOD_sample=769.2; //1,3MHz

reg clock;
reg clock_sample;

reg [31:0] wave;
reg [31:0] memory [0:519];
reg [9:0] i;




reg [63:0] a;
reg [63:0] b;
wire [63:0] c;
reg clr;
reg [63:0] _64;
reg [31:0] _32;



initial
begin
	_32=0;
	_64=0;
	a=64'h3FF8000000000000; //1.5
	b=64'hBFF8000000000000; //-1.5
	clr=0;
	i = 0;
	clock=0;
	clock_sample=0;
	$readmemh("sine.txt", memory);
#1000;
	clr =1;
#1000;
clr=0;
#1000;
clr=1;
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




fpmult fpmult_i1
(
	.aclr(clr),
	.clock(clock),
	.dataa(a),
	.datab(b),
	.result(c)
);

fp64int32conv fp64int32conv_i1
(
	.aclr (clr),
	.clock (clock),
	.dataa (c),
	.result (_32)
);



fp64int64conv fp64int64conv_i1
(
	.aclr (clr),
	.clock (clock),
	.dataa (c),
	.result (_64)
);

always @(posedge clock)
begin

	wave <= memory[i];

	i = i+1;
	if (i >= 520)
		i = 0;

end


endmodule




