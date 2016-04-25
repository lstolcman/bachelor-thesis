
module goertzel
(
	input clock, //130MHz
	input clock_sample, //1,3MHz
	input signed [31:0] sample,

	output reg ready = 1'd0,
	output reg [63:0] power = 64'd0
);


reg [63:0] coeff = 64'h3FFDC7FE93706522;

reg signed [31:0] sample_reg = 32'd0;

reg [63:0] q0 = 64'd0;
reg [63:0] q1 = 64'd0;
reg [63:0] q2 = 64'd0;
reg [63:0] q0_tmp = 64'd0;
reg [63:0] q1_tmp = 64'd0;
reg [63:0] q2_tmp = 64'd0;
reg [9:0] i = 10'd0;
reg [9:0] sample_counter = 10'd0;
reg [9:0] sample_counter_test = 10'd0;




// sample_reg = double(sample_reg)
reg int32fp64conv_i1_aclr = 1'd1;
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
reg fpmult_i1_aclr = 1'd1;
reg fpsub_i1_aclr = 1'd1;
reg fpadd_i1_aclr = 1'd1;
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
reg fpmult_i2_1_aclr = 1'd1;
reg fpmult_i2_2_aclr = 1'd1;
reg fpmult_i2_3_aclr = 1'd1;
reg fpmult_i2_4_aclr = 1'd1;
reg fpadd_i2_aclr = 1'd1;
reg fpsub_i2_aclr = 1'd1;
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

	sample_reg <= sample;
	sample_counter <= sample_counter+1;

	// result = ((q1**2) + (q2**2)) - ((q1*q2)*coeff)
	// all "*_aclr<=1" signals clear output values of floating point blocks
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
		519:
			// 520 samples collected, store results to tmp and compute power
			begin
				sample_counter <= 0;
				// store values to temporary registers to further calcuations
				// of result
				q0_tmp <= q0;
				q1_tmp <= q1;
				q2_tmp <= q2;
				fpmult_i2_1_aclr <= 1;
				fpmult_i2_2_aclr <= 1;
				fpmult_i2_3_aclr <= 1;
				fpmult_i2_4_aclr <= 1;
				fpadd_i2_aclr <= 1;
				fpsub_i2_aclr <= 1;
			end
	endcase

end


always @(posedge clock)
begin

	// test if new sample arrived => if true reset counter to zero
	if (sample_counter != sample_counter_test)
		i <= 0;
	else
		i <= i+1;

	sample_counter_test <= sample_counter;

	// reset registers to zero before loop calculation
	if ( (i == 0) && (sample_counter == 0) )
	begin
		q0 <= 64'd0;
		q1 <= 64'd0;
		q2 <= 64'd0;
	end

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
		94: q0 <= fpadd_i1_result;
		95: q2 <= q1;
		96: q1 <= q0;
	endcase

end



endmodule

