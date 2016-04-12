module mult
(
	input [15:0] sin,
	input [21:0] data_in,
	
	output [21:0] data_out
);

assign data_out = data_in * sin;


endmodule



module testpll_board
(
	input pll_board_in,
	input pll_uart_in,
	output reg led_board,
	output reg led_uart,
	
	input clka,
	output reg clkaout
);
	


reg [28:0] cnt1;
reg [28:0] cnt2;
reg [28:0] cnt3;

always @(posedge pll_board_in)
begin
	cnt1<=cnt1+1;
	if (cnt1 >= 65_000_000)
	begin
		cnt1 <= 0;
		led_board <= ~led_board;
	end
end


always @(posedge pll_uart_in)
begin
	cnt2<=cnt2+1;
	if (cnt2 >= 345_600)
	begin
		cnt2 <= 0;
		led_uart <= ~led_uart;
	end
end


always @(posedge clka)
begin
	cnt3<=cnt3+1;
	if (cnt3 >= 65_000_000)
	begin
		cnt3 <= 0;
		clkaout <= ~clkaout;
	end
end




endmodule