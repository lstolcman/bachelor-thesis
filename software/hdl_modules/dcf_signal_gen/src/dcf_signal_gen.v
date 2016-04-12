
module dcf_signal_gen
(
	input clock,
	input [58:0] time_data,

	output reg signal = 1'b1
);


reg signal_high = 1'b1;
reg [3:0] second_tick = 4'b0;
reg [5:0] bit_position = 6'b0;


always @(posedge clock)
begin

		if (second_tick >= 9)
			second_tick <= 0;
		else
			second_tick <= second_tick + 1;


		if (second_tick == 9)
		begin
			if (bit_position == 59)
				bit_position <= 0;
			else
				bit_position <= bit_position+1;
		end


	if (bit_position == 59 && second_tick > 2)
		signal <= 1;
	else
	begin

		if (second_tick == 9)
			signal <= 0;

		if (second_tick == 0 && time_data[59-bit_position] == 0)
			signal <= 1;

		if (second_tick == 1 && time_data[59-bit_position] == 1)
			signal <= 1;
	end

end


endmodule

