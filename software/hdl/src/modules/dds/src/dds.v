
module uart
(
	input clock,
	input reset_n,

	input send,
	output reg done,

	input [7:0] data,
	output reg tx
);


// state machine for asynchronous send detect

reg send_state;
reg send_state_next;
reg [7:0] data_sync;

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
			if (send && done)
			begin
				send_state_next = 1;
				data_sync = data;
			end
		1:
			if (!done)
				send_state_next = 0;
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



reg [3:0] data_counter;
enum {S0, S1, S2} state;

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

