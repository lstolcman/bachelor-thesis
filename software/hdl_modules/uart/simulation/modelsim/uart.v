`timescale 1ns/10ps

module uart_tb
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
reg send;
reg done;
reg [7:0] data;
reg tx;

initial
begin
clock=0;
#50;
reset_n = 0;
send = 0;
data = 8'b0100_0111;
#50;
reset_n = 1;

#65;
send=1;

end

always
begin
	clock=~clock;
#20;
end




// state machine for dectecting strobe for active data which is asynchronous with clk_tx

reg send_sync;
reg send_state;
reg send_state_next;
reg [7:0] data_sync;

always @(*)
begin
	if (reset_n == 0)
	begin
		send_sync = 0;
		send_state = 0;
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
	send_state <= send_state_next;
end


reg [3:0] data_counter;
enum {S0, S1, S2} state;

always @(posedge clock)
begin
	
	if (reset_n == 0)
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
				done <= 1;
			end

		default:
			state <= S0;

	endcase
	end



end

endmodule

