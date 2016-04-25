`timescale 1ns/1ps

module fir_first_tb();

parameter CLK_PERIOD=7.69231ns; //130MHz

reg clock;
reg reset_n;

wire signed [19:0] f77k5;
wire signed [19:0] f700k;
wire signed [20:0] sum1;
wire signed [15:0] sum;
assign sum1 = f77k5+f700k;
assign sum = sum1[20:5];


/*
* ref: http://billauer.co.il/blog/2012/10/signed-arithmetics-verilog/
*/


integer i;
reg [15:0] memory [0:1299];

initial
begin
	i=0;
	clock=0;
	reset_n=0;
#1us;
	reset_n=1;
end


always
begin
	clock=~clock;
	#(CLK_PERIOD/2);
end

cordic cordic_i1
(
	.clock(clock), //130MHz
	.phase_inc(32'd2560461), //77,5 kHz
	.re(f77k5),
	.im(),
	.re_u(),
	.im_u()
);

cordic cordic_i2
(
	.clock(clock), //130MHz
	.phase_inc(32'd594687779), //700kHz
	.re(f700k),
	.im(),
	.re_u(),
	.im_u()
);

wire signed [22:0] out_data;
wire signed [15:0] out = out_data[22:7];
wire out_valid;
fir_first fir_first_i1
(
	.clk(clock),
	.reset_n(reset_n),
	.ast_sink_data(sum),
	.ast_sink_valid(1'b1),
	.ast_sink_error(2'd0),
	.ast_source_data(out_data),
	.ast_source_valid(out_valid),
	.ast_source_error()
/*
input  wire        clk,
input  wire        reset_n,
input  wire [15:0] ast_sink_data,
input  wire        ast_sink_valid,
input  wire [1:0]  ast_sink_error,
output wire [22:0] ast_source_data,
output wire        ast_source_valid,
output wire [1:0]  ast_source_error
*/
);



always @(posedge out_valid)
begin
	memory[i] = out_data;
	i=i+1;
	if (i == 1300)
		$writememh("first_stage_out.txt", memory);
end




endmodule




