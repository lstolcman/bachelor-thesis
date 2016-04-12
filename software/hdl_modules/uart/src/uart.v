
module uart
(
	input clock,
	input reset_n,

	input send,
	output reg done = 1'b1,

	input [7:0] data,
	output reg tx = 1'b0
);


// state machine for asynchronous send detect

reg send_state = 1'b0;
reg send_state_next = 1'b0;
reg [7:0] data_sync = 8'b0;

always @(*)
begin
	if (!reset_n)
	begin
		send_state_next = 0;
		data_sync = 8'd0;
	end
	else
	begin
	case(send_state)

		0:
			begin
				if (send && done)
				begin
					send_state_next = 1;
					data_sync = data;
				end
			end

		1:
			begin
				if (!done)
					send_state_next = 0;
			end

	endcase
	end
end

always @(posedge clock)
begin

	if (!reset_n)
		send_state <= 0;
	else
		send_state <= send_state_next;

end



reg [3:0] data_counter = 4'b0;
enum {S0, S1, S2} state = S0;

always @(posedge clock)
begin
	
	if (!reset_n)
	begin
		state <= S0;
		done <= 1;
		tx <= 1;
		data_counter <= 0;
	end
	else
	begin
	case (state)

		S0: //idle
			begin
				if (send_state && done)
				begin
					tx <= 0; // start bit
					done <= 0;
					data_counter <= 0;
					state <= S1;
				end
				else
				begin
					tx <= 1;
					done <= 1;
				end
			end

		S1: //transfer bits
			begin
				tx <= data_sync[data_counter];
				data_counter <= data_counter+1;
				if (data_counter == 7)
				begin
					state <= S2;
				end
			end

		S2: //stop bit
			begin
				tx <= 1;
				state <= S0;
				//done <= 1;
			end

		default:
			state <= S0;

	endcase
	end



end

endmodule

