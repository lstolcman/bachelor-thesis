`timescale 1ns/1ps

module cic_tb();

parameter CLK_PERIOD=7.69231ns; //130MHz

reg clock;
reg reset_n;

wire signed [19:0] f77k5;
wire signed [19:0] f700k;
wire signed [20:0] sum1;
wire signed [19:0] sum;
assign sum1 = f77k5+f700k;
assign sum = sum1[20:1];


/*
* ref: http://billauer.co.il/blog/2012/10/signed-arithmetics-verilog/
*/

integer i;
reg signed [15:0] memory [0:1299];

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
	.phase_inc(32'd23126747), //700kHz
	.re(f700k),
	.im(),
	.re_u(),
	.im_u()
);



wire in_ready;
wire out_valid;
wire [1:0] out_error;
wire signed [53:0] out_data;
wire signed [15:0] out = out_data[53:38];

cic cic_i1
(
	.clk(clock),
	.reset_n(reset_n),
	.in_valid(1'b1),
	.in_error(2'b00),
	.in_data(sum),
	.in_ready(in_ready),
	.out_ready(1'b1),
	.out_valid(out_valid),
	.out_error(out_error),
	.out_data(out_data)
/*
input  wire        in_valid,  //          .valid
input  wire [1:0]  in_error,  //  av_st_in.error
input  wire [19:0] in_data,   //          .in_data
output wire        in_ready,  //          .ready
input  wire        out_ready, //          .ready
output wire        out_valid, //          .valid
output wire [1:0]  out_error, //          .error
output wire [53:0] out_data,  // av_st_out.out_data

input  wire        clk,       //     clock.clk
input  wire        reset_n    //     reset.reset_n
*/
);


always @(posedge out_valid)
begin
	memory[i] <= out;
	i=i+1;
	if (i == 1300)
		$writememh("first_stage_out.txt", memory);
end


endmodule




