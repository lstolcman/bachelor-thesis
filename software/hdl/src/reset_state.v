
//Reset circuitry to its initial state
module reset_state
(
	input clock,
	output reg reset_n = 1'd0
);


reg [5:0] cnt = 0;

always @(posedge clock)
begin

	if (cnt < 16)
	begin
		cnt <= cnt+1;
		reset_n <= 1'd0;
	end
	else
	begin
		reset_n <= 1'd1;
	end

end


endmodule
