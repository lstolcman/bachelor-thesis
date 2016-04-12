
module goertzel
(
	input clock, //130MHz
	input clock_sample, //1,3MHz
	input reset_n,
	input signed [31:0] sample,

	output reg ready,
	output reg [63:0] power
);

reg signed [31:0] sample_reg;

reg [63:0] coeff;
reg [63:0] q0;
reg [63:0] q1;
reg [63:0] q2;
reg [63:0] q0_tmp;
reg [63:0] q1_tmp;
reg [63:0] q2_tmp;
reg [9:0] i;
reg [9:0] sample_counter;

//$warning("signed values!");
//$warning(" wire signed insted of reg in connections?");
//$warning("floating point result to integer convert");



// sample_reg = double(sample_reg)
reg int32fp64conv_i1_aclr;
wire [63:0] int32fp64conv_i1_result;
int32fp64conv int32fp64conv_i1
(
	.aclr(int32fp64conv_i1_aclr),
	.clock(clock),
	.dataa(sample_reg),
	.result(int32fp64conv_i1_result)
);
//-----------------------------------------------------------------------------




// q0 = ((coeff * q1) - q2) + sample_reg;
reg fpmult_i1_aclr;
reg fpsub_i1_aclr;
reg fpadd_i1_aclr;
wire [63:0] fpmult_i1_result;
wire [63:0] fpsub_i1_result;
wire [63:0] fpadd_i1_result;
fpmult fpmult_i1
(
	.aclr(fpmult_i1_aclr),
	.clock(clock),
	.dataa(coeff),
	.datab(q1),
	.result(fpmult_i1_result)
);

fpsub fpsub_i1
(
	.aclr(fpsub_i1_aclr),
	.clock(clock),
	.dataa(fpmult_i1_result),
	.datab(q2),
	.result(fpsub_i1_result)
);

fpadd fpadd_i1
(
	.aclr(fpadd_i1_aclr),
	.clock(clock),
	.dataa(fpsub_i1_result),
	.datab(int32fp64conv_i1_result),
	.result(fpadd_i1_result)
);
//-----------------------------------------------------------------------------




// result = ((q1**2) + (q2**2)) - ((q1*q2)*coeff)
reg fpmult_i2_1_aclr;
reg fpmult_i2_2_aclr;
reg fpmult_i2_3_aclr;
reg fpmult_i2_4_aclr;
reg fpadd_i2_aclr;
reg fpsub_i2_aclr;
wire [63:0] fpmult_i2_1_result;
wire [63:0] fpmult_i2_2_result;
wire [63:0] fpmult_i2_3_result;
wire [63:0] fpmult_i2_4_result;
wire [63:0] fpadd_i2_result;
wire [63:0] fpsub_i2_result;
fpmult fpmult_i2_1
(
	.aclr(fpmult_i2_1_aclr),
	.clock(clock),
	.dataa(q1_tmp),
	.datab(q1_tmp),
	.result(fpmult_i2_1_result)

);

fpmult fpmult_i2_2
(
	.aclr(fpmult_i2_2_aclr),
	.clock(clock),
	.dataa(q2_tmp),
	.datab(q2_tmp),
	.result(fpmult_i2_2_result)
);

fpmult fpmult_i2_3
(
	.aclr(fpmult_i2_3_aclr),
	.clock(clock),
	.dataa(q1_tmp),
	.datab(q2_tmp),
	.result(fpmult_i2_3_result)
);

fpmult fpmult_i2_4
(
	.aclr(fpmult_i2_4_aclr),
	.clock(clock),
	.dataa(fpmult_i2_3_result),
	.datab(coeff),
	.result(fpmult_i2_4_result)
);

fpadd fpadd_i2
(
	.aclr(fpadd_i2_aclr),
	.clock(clock),
	.dataa(fpmult_i2_1_result),
	.datab(fpmult_i2_2_result),
	.result(fpadd_i2_result)
);

fpsub fpsub_i2
(
	.aclr(fpsub_i2_aclr),
	.clock(clock),
	.dataa(fpadd_i2_result),
	.datab(fpmult_i2_4_result),
	.result(fpsub_i2_result)
);
//-----------------------------------------------------------------------------



// result = integer(result)
wire signed [63:0] fp64int64conv_i1_result;
fp64int64conv fp64int64conv_i1
(
	.aclr(1'b0),
	.clock(clock),
	.dataa(fpsub_i2_result),
	.result(fp64int64conv_i1_result)
);
//-----------------------------------------------------------------------------


always @(posedge ready)
begin
	power <= fp64int64conv_i1_result;
end



always @(posedge clock_sample)
begin

	if (reset_n == 0)
	begin
		sample_reg <= 64'd0;
		sample_counter <= 0;
	end
	else
	begin
		sample_reg <= sample;
		sample_counter <= sample_counter+1;
	end

	i<= 0;

end


always @(posedge clock)
begin

	if (reset_n == 0)
	begin
		ready <= 1'd0;
		power <= 64'd0;
		coeff <= 64'h3FFDC7FE93706522;
		q0 <= 64'd0;
		q1 <= 64'd0;
		q2 <= 64'd0;
		q0_tmp <= 64'd0;
		q1_tmp <= 64'd0;
		q2_tmp <= 64'd0;
		fpmult_i1_aclr <= 1;
		fpadd_i1_aclr <= 1;
		fpsub_i1_aclr <= 1;
	end
	else
	begin

		i<=i+1;

		// do loop calculation: 
		// 	for n in range(N):
		//		q0 = ((coeff * q1) - q2) + sample_reg
		//		q2 = q1
		//		q1 = q0
		case (i)
			0:
				begin
					int32fp64conv_i1_aclr <= 1;
					fpmult_i1_aclr <= 1;
					fpadd_i1_aclr <= 1;
					fpsub_i1_aclr <= 1;
				end
			10: int32fp64conv_i1_aclr <= 0;
			20:	fpmult_i1_aclr <= 0;
			30: fpsub_i1_aclr <= 0;
			40: fpadd_i1_aclr <= 0;
			50: q0 <= fpadd_i1_result;
			51: q2 <= q1;
			52: q1 <= q0;
		endcase


		// result = ((q1**2) + (q2**2)) - ((q1*q2)*coeff)
		case (sample_counter)
			10:
				begin
					fpmult_i2_1_aclr <= 0;
					fpmult_i2_2_aclr <= 0;
					fpmult_i2_3_aclr <= 0;
	 			end
			20:	fpmult_i2_4_aclr <= 0;
			30: fpadd_i2_aclr <= 0;
			40: fpsub_i2_aclr <= 0;
			50:	ready <= 1;
			51: ready <= 0;
			520:
				// 520 samples collected, store results to tmp and compute
				// power
				begin
					sample_counter <= 0;
					q0_tmp <= q0;
					q1_tmp <= q1;
					q2_tmp <= q2;
					q0 <= 64'd0;
					q1 <= 64'd0;
					q2 <= 64'd0;
					fpmult_i2_1_aclr <= 1;
					fpmult_i2_2_aclr <= 1;
					fpmult_i2_3_aclr <= 1;
					fpmult_i2_4_aclr <= 1;
					fpadd_i2_aclr <= 1;
					fpsub_i2_aclr <= 1;
				end
		endcase

	end

end





/*

reg [9:0] i;
reg [63:0] q0;
reg [63:0] q1;
reg [63:0] q2;
reg [63:0] q0_tmp;
reg [63:0] q1_tmp;
reg [63:0] q2_tmp;

reg [63:0] coeff; // coefficient for 77,5kHz in double format


always @(posedge clock_sample)
begin
	if (reset_n == 0)
	begin
		i <= 0;
		q0 <= 64'h0;
		q1 <= 64'h0;
		q2 <= 64'h0;
		q0_tmp <= 64'h0;
		q1_tmp <= 64'h0;
		q2_tmp <= 64'h0;

		// http://www.binaryconvert.com/convert_double.html
		coeff = 64'h3FFDC7FE93706522; // coefficient for 77,5kHz in double format
	end
	else
	begin

		if (i >= 519)
		begin
			i <= 0;
			q0_tmp <= q0;
			q1_tmp <= q1;
			q2_tmp <= q2;
			

			// tmp vars
		end
		else
		begin
			i <= i+1;
			q0 <= coeff * q1 - q2 + sample;
			q2 <= q1;
			q1 <= q0;
		end

	end
end




always @(posedge clock)
begin

	// at this point we certainly have latched values in
	// q0_tmp, q1_tmp, q2_tmp
	if (i == 1)
	begin
		//result = q1**2 + q2**2 - q1*q2*coeff;
	end

end
*/

endmodule





/*

def goert(samples, sample_rate, freq):

	N = len(samples)

	k=int((N*freq)/sample_rate)
	w = 2.0 * np.pi / N * k
	cosine = np.cos(w)
	coeff = 2 * cosine
	print("%.90f"% coeff)

	if (freq==77500): coeff = 1.86132676690460430179996365041;

	q0 = 0.0
	q1 = 0.0
	q2 = 0.0
	for n in range(N):
		q0 = coeff * q1 - q2 + samples[n]
		q2 = q1
		q1 = q0

	result = q1**2 + q2**2 - q1*q2*coeff
	return result

*/
