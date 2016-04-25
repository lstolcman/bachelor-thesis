`timescale 1ns/1ns

module fir_second_tb();

parameter CLK_PERIOD=769.231ns; //1,3MHz
parameter CLK_PERIOD2=7.69231ns; //130MHz

reg clock1_3;
reg clock130;
reg reset_n;


/*
* ref: http://billauer.co.il/blog/2012/10/signed-arithmetics-verilog/
*/


reg signed [15:0] datain;
reg signed [15:0] memory [0:1299];
integer i=0;

initial
begin
	$readmemh("first_stage_out.txt", memory);
	clock1_3=0;
	clock130=0;
	i=0;
	datain=0;
	reset_n=0;
#1us;
	reset_n=1;
end


always
begin
	clock1_3=~clock1_3;
	#(CLK_PERIOD/2);
end

always
begin
	clock130=~clock130;
	#(CLK_PERIOD2/2);
end

always @(posedge clock1_3)
begin
	if (reset_n)
	begin
		datain <= memory[i];
		i=i+1;
		if (i>=1300)
			i=0;
	end
end

wire signed [33:0] out_data;
//wire signed [33:0] out = out_data[22:7];
wire out_valid;
wire [1:0] out_error;
fir_second fir_second_i1
(
	.clk(clock130),
	.reset_n(reset_n),
	.ast_sink_data(datain),
	.ast_sink_valid(clock1_3),
	.ast_sink_error(2'd0),
	.ast_source_data(out_data),
	.ast_source_valid(out_valid),
	.ast_source_error(out_error)
/*
input  wire        clk,
input  wire        reset_n,
input  wire [15:0] ast_sink_data,
input  wire        ast_sink_valid,
input  wire [1:0]  ast_sink_error,
output wire [21:0] ast_source_data,
output wire        ast_source_valid,
output wire [1:0]  ast_source_error
*/
);

reg [33:0] out;
always @(posedge out_valid)
begin
	out<=out_data;
end

endmodule




