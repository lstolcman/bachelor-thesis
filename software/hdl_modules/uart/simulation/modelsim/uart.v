`timescale 1us/1ns

module uart_tb();

parameter clk_period = 8.68us;


reg clock;
reg reset_n;

reg send;
wire done;

reg [7:0] data;
wire tx;



uart i1
(
	.clock(clock),
	.reset_n(reset_n),
	.send(send),
	.done(done),
	.data(data),
	.tx(tx)
);


initial
begin
	clock = 0;
	reset_n = 0;
	data = 8'b01000000;
	send = 1'b0;

#20;
reset_n=1;
#22;
send=1;
#5;
send=0;

#200;
send=1;
#150;
send=0;

end

always
begin

	clock = ~clock;
#(clk_period/2);

end




endmodule

