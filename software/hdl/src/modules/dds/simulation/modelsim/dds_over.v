`timescale 1ns/1ps

module uart_over_tb();

reg clock;
reg reset_n;

reg send;
wire done;

reg [7:0] data;
wire tx;



uart u1
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
	clock=0;
	reset_n=0;
	send=0;
	data = 8'd01000000;

#50;
reset_n=1;
#54;
send=1;
#5;
send=0;

#250;
send=1;
#50;
send=0;

end

always
begin
	clock = ~clock;
#10;

end




endmodule

