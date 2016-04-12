
`timescale 1ns/100ps


module uart_tb();

	reg CLOCK_50;
	reg CLOCK_130;
	reg signed [15:0] DA;
	wire [2:1] TX;

	wire pll_uart_clk;





	wire reset_n;
	reset_state rst1
	(
		.clock(CLOCK_130),
		.reset_n(reset_n)
	);

	pll_uart pll_uart_i1
	(
		.inclk0(CLOCK_50),
		.c0(pll_uart_clk)
	);



	reg send;
	wire done;
	uart uart_i1
	(
		.clock(pll_uart_clk),
		.reset_n(reset_n),

		.send(send),
		.done(done),

		.data(DA[7:0]),
		.tx(tx)
	);



initial
begin

	send=0;
	CLOCK_50=0;
	CLOCK_130=0;
	DA=0;

end


parameter clk50_perios_ns = 20; //50MHz
parameter clk130_perios_ns = 7.692; //130MHz

always
begin
#(clk50_perios_ns/2);
CLOCK_50=~CLOCK_50;
end

always
begin
#(clk130_perios_ns/2);
CLOCK_130=~CLOCK_130;
end


always @(posedge CLOCK_130)
begin
	DA = $random;
end



endmodule
