
module board_iface
(
	input clk2mhz,
	
	input [15:0] data_in,
	input ofa,
	
	input clkouta, //clkout_p
	input clkoutb, //clkout_n
		
	output reg dith,
	output reg rand_,
	output reg pga,
	
	output reg enc,
	
	output reg [7:0] LED,
	
	output reg [15:0] data_out,
	output reg data_out_rdy
	

);

reg [31:0] cnt_uart;
always @(posedge clk2mhz)
begin
	enc <= ~enc;
end

always @(posedge clkouta)
begin
	cnt_uart<=cnt_uart+1;
	//if(cnt_uart > 1000000)
	//	data_out_rdy<=0;
	if(cnt_uart > 20000)
	begin
		cnt_uart	<=	0;
		data_out_rdy<=1;
		data_out	<=	data_in;
		LED <= data_in[8:1];
	end
end

endmodule

