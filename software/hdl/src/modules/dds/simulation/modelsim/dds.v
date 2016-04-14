`timescale 1ns/10ps

module dds_tb
(
	/*
	input clock,
	input reset_n,

	input send,
	output reg done,

	input [7:0] data,
	output reg tx
	*/
);


reg clock;
reg reset_n;
reg wave;

initial
begin
clock=0;
#50;
reset_n = 0;
#50;
reset_n = 1;

end

always
begin
	clock=~clock;
#20;
end


reg [5:0] cnt;

always @(posedge clock)
begin
	
	if (reset_n == 0)
	begin
		wave <= 0;
		cnt <= 0;
	end
	else
	begin
		wave <= mem[cnt];
		cnt <= cnt+1;
	end



end

endmodule

