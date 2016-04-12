//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       James C. Ahlstrom
// 
// Create Date:    12:31:22 5/2/2007
// Design Name:    Cordic Module
// Module Name:    cordic1
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 17 Aug 2009
// Revision 0.02 - Modified for real input, complex output
// Additional Comments: 
//   VNA features added January 2012.
//
//////////////////////////////////////////////////////////////////////////////////


module cordic
(
	input wire clock,
	input wire [31:0] phase_inc,
	output signed [19:0] re,
	output signed [19:0] im,
	output unsigned [19:0] re_u,
	output unsigned [19:0] im_u
);


	parameter atan0 = 32'h20000000;	// CORDIC parameters
	parameter atan1 = 32'h12E4051E;
	parameter atan2 = 32'h9FB385B;
	parameter atan3 = 32'h51111D4;
	parameter atan4 = 32'h28B0D43;
	parameter atan5 = 32'h145D7E1;
	parameter atan6 = 32'hA2F61E;
	parameter atan7 = 32'h517C55;
	parameter atan8 = 32'h28BE53;
	parameter atan9 = 32'h145F2F;
	parameter atan10 = 32'hA2F98;
	parameter atan11 = 32'h517CC;
	parameter atan12 = 32'h28BE6;
	parameter atan13 = 32'h145F3;
	parameter atan14 = 32'hA2FA;
	parameter atan15 = 32'h517D;
	parameter atan16 = 32'h28BE;
	parameter atan17 = 32'h145F;
	parameter atan18 = 32'hA30;
	parameter atan19 = 32'h518;
	parameter atan20 = 32'h28C;
	parameter atan21 = 32'h146;
	parameter atan22 = 32'hA3;
	parameter atan23 = 32'h51;
	parameter atan24 = 32'h29;
	parameter atan25 = 32'h14;
	parameter atan26 = 32'hA;
	parameter atan27 = 32'h5;
	parameter atan28 = 32'h3;
	parameter atan29 = 32'h1;
	parameter atan30 = 'h1;

	parameter Amplitude = 20'b01000000000000000000; // 2 ** 18
	
	// Gain of CORDIC is 1.647.
	reg [31:0] phase = 0;
	// CORDIC phase variables - 32 bits
	reg [31:0] zz0,  zz1,  zz2,  zz3,  zz4,  zz5,  zz6,  zz7,  zz8,  zz9,
		zz10, zz11, zz12, zz13, zz14, zz15, zz16, zz17, zz18, zz19,
		zz20, zz21, zz22, zz23, zz24, zz25, zz26, zz27, zz28, zz29,
		zz30;
	// CORDIC data variables - 20 bits
	reg signed [19:0]
		re0,  re1,  re2,  re3,  re4,  re5,  re6,  re7,  re8,  re9,
		re10, re11, re12, re13, re14, re15, re16, re17, re18, re19,
		re20, re21, re22, re23, re24, re25, re26, re27, re28, re29,
		re30, re31,
		im0,  im1,  im2,  im3,  im4,  im5,  im6,  im7,  im8,  im9,
		im10, im11, im12, im13, im14, im15, im16, im17, im18, im19,
		im20, im21, im22, im23, im24, im25, im26, im27, im28, im29,
		im30, im31;

	assign re = re31;
	assign im = im31;

	assign re_u = re[19] ? re-2**19: re+2**19;
	assign im_u = im[19] ? im-2**19: im+2**19;

	always @(posedge clock)
	begin
		////// Generate output frequency using CORDIC
		// Use an large number as the starting amplitude.
		phase <= phase + phase_inc;		// Decrement phase

		// Initial rotation from quadrant 2 or 3 to quadrant 1 or 2
		if (phase[31:30] == 2'b01)		// second quadrant, rotate by 90 degrees
			begin
				re0 <= 0;
				im0 <= Amplitude;
				zz0 <= {2'b00, phase[29:0]};
			end
		else if (phase[31:30] == 2'b10)	// third quadrant, rotate by 180
			begin
				re0 <= - Amplitude;
				im0 <= 0;
				zz0 <= {2'b00, phase[29:0]};
			end
		else
			begin
				re0 <= Amplitude;
				im0 <= 0;
				zz0 <= phase;
			end
		// Start of CORDIC
		if (zz0[31])
			begin
				re1 <= re0 + (im0 >>> 0);
				im1 <= im0 - (re0 >>> 0);
				zz1 <= zz0 + atan0;
			end
		else
			begin
				re1 <= re0 - (im0 >>> 0);
				im1 <= im0 + (re0 >>> 0);
				zz1 <= zz0 - atan0;
			end

		if (zz1[31])
			begin
				re2 <= re1 + (im1 >>> 1);
				im2 <= im1 - (re1 >>> 1);
				zz2 <= zz1 + atan1;
			end
		else
			begin
				re2 <= re1 - (im1 >>> 1);
				im2 <= im1 + (re1 >>> 1);
				zz2 <= zz1 - atan1;
			end

		if (zz2[31])
			begin
				re3 <= re2 + (im2 >>> 2);
				im3 <= im2 - (re2 >>> 2);
				zz3 <= zz2 + atan2;
			end
		else
			begin
				re3 <= re2 - (im2 >>> 2);
				im3 <= im2 + (re2 >>> 2);
				zz3 <= zz2 - atan2;
			end

		if (zz3[31])
			begin
				re4 <= re3 + (im3 >>> 3);
				im4 <= im3 - (re3 >>> 3);
				zz4 <= zz3 + atan3;
			end
		else
			begin
				re4 <= re3 - (im3 >>> 3);
				im4 <= im3 + (re3 >>> 3);
				zz4 <= zz3 - atan3;
			end

		if (zz4[31])
			begin
				re5 <= re4 + (im4 >>> 4);
				im5 <= im4 - (re4 >>> 4);
				zz5 <= zz4 + atan4;
			end
		else
			begin
				re5 <= re4 - (im4 >>> 4);
				im5 <= im4 + (re4 >>> 4);
				zz5 <= zz4 - atan4;
			end

		if (zz5[31])
			begin
				re6 <= re5 + (im5 >>> 5);
				im6 <= im5 - (re5 >>> 5);
				zz6 <= zz5 + atan5;
			end
		else
			begin
				re6 <= re5 - (im5 >>> 5);
				im6 <= im5 + (re5 >>> 5);
				zz6 <= zz5 - atan5;
			end

		if (zz6[31])
			begin
				re7 <= re6 + (im6 >>> 6);
				im7 <= im6 - (re6 >>> 6);
				zz7 <= zz6 + atan6;
			end
		else
			begin
				re7 <= re6 - (im6 >>> 6);
				im7 <= im6 + (re6 >>> 6);
				zz7 <= zz6 - atan6;
			end

		if (zz7[31])
			begin
				re8 <= re7 + (im7 >>> 7);
				im8 <= im7 - (re7 >>> 7);
				zz8 <= zz7 + atan7;
			end
		else
			begin
				re8 <= re7 - (im7 >>> 7);
				im8 <= im7 + (re7 >>> 7);
				zz8 <= zz7 - atan7;
			end

		if (zz8[31])
			begin
				re9 <= re8 + (im8 >>> 8);
				im9 <= im8 - (re8 >>> 8);
				zz9 <= zz8 + atan8;
			end
		else
			begin
				re9 <= re8 - (im8 >>> 8);
				im9 <= im8 + (re8 >>> 8);
				zz9 <= zz8 - atan8;
			end

		if (zz9[31])
			begin
				re10 <= re9 + (im9 >>> 9);
				im10 <= im9 - (re9 >>> 9);
				zz10 <= zz9 + atan9;
			end
		else
			begin
				re10 <= re9 - (im9 >>> 9);
				im10 <= im9 + (re9 >>> 9);
				zz10 <= zz9 - atan9;
			end

		if (zz10[31])
			begin
				re11 <= re10 + (im10 >>> 10);
				im11 <= im10 - (re10 >>> 10);
				zz11 <= zz10 + atan10;
			end
		else
			begin
				re11 <= re10 - (im10 >>> 10);
				im11 <= im10 + (re10 >>> 10);
				zz11 <= zz10 - atan10;
			end

		if (zz11[31])
			begin
				re12 <= re11 + (im11 >>> 11);
				im12 <= im11 - (re11 >>> 11);
				zz12 <= zz11 + atan11;
			end
		else
			begin
				re12 <= re11 - (im11 >>> 11);
				im12 <= im11 + (re11 >>> 11);
				zz12 <= zz11 - atan11;
			end

		if (zz12[31])
			begin
				re13 <= re12 + (im12 >>> 12);
				im13 <= im12 - (re12 >>> 12);
				zz13 <= zz12 + atan12;
			end
		else
			begin
				re13 <= re12 - (im12 >>> 12);
				im13 <= im12 + (re12 >>> 12);
				zz13 <= zz12 - atan12;
			end

		if (zz13[31])
			begin
				re14 <= re13 + (im13 >>> 13);
				im14 <= im13 - (re13 >>> 13);
				zz14 <= zz13 + atan13;
			end
		else
			begin
				re14 <= re13 - (im13 >>> 13);
				im14 <= im13 + (re13 >>> 13);
				zz14 <= zz13 - atan13;
			end

		if (zz14[31])
			begin
				re15 <= re14 + (im14 >>> 14);
				im15 <= im14 - (re14 >>> 14);
				zz15 <= zz14 + atan14;
			end
		else
			begin
				re15 <= re14 - (im14 >>> 14);
				im15 <= im14 + (re14 >>> 14);
				zz15 <= zz14 - atan14;
			end

		if (zz15[31])
			begin
				re16 <= re15 + (im15 >>> 15);
				im16 <= im15 - (re15 >>> 15);
				zz16 <= zz15 + atan15;
			end
		else
			begin
				re16 <= re15 - (im15 >>> 15);
				im16 <= im15 + (re15 >>> 15);
				zz16 <= zz15 - atan15;
			end

		if (zz16[31])
			begin
				re17 <= re16 + (im16 >>> 16);
				im17 <= im16 - (re16 >>> 16);
				zz17 <= zz16 + atan16;
			end
		else
			begin
				re17 <= re16 - (im16 >>> 16);
				im17 <= im16 + (re16 >>> 16);
				zz17 <= zz16 - atan16;
			end

		if (zz17[31])
			begin
				re18 <= re17 + (im17 >>> 17);
				im18 <= im17 - (re17 >>> 17);
				zz18 <= zz17 + atan17;
			end
		else
			begin
				re18 <= re17 - (im17 >>> 17);
				im18 <= im17 + (re17 >>> 17);
				zz18 <= zz17 - atan17;
			end

		if (zz18[31])
			begin
				re19 <= re18 + (im18 >>> 18);
				im19 <= im18 - (re18 >>> 18);
				zz19 <= zz18 + atan18;
			end
		else
			begin
				re19 <= re18 - (im18 >>> 18);
				im19 <= im18 + (re18 >>> 18);
				zz19 <= zz18 - atan18;
			end

		if (zz19[31])
			begin
				re20 <= re19 + (im19 >>> 19);
				im20 <= im19 - (re19 >>> 19);
				zz20 <= zz19 + atan19;
			end
		else
			begin
				re20 <= re19 - (im19 >>> 19);
				im20 <= im19 + (re19 >>> 19);
				zz20 <= zz19 - atan19;
			end

		if (zz20[31])
			begin
				re21 <= re20 + (im20 >>> 20);
				im21 <= im20 - (re20 >>> 20);
				zz21 <= zz20 + atan20;
			end
		else
			begin
				re21 <= re20 - (im20 >>> 20);
				im21 <= im20 + (re20 >>> 20);
				zz21 <= zz20 - atan20;
			end

		if (zz21[31])
			begin
				re22 <= re21 + (im21 >>> 21);
				im22 <= im21 - (re21 >>> 21);
				zz22 <= zz21 + atan21;
			end
		else
			begin
				re22 <= re21 - (im21 >>> 21);
				im22 <= im21 + (re21 >>> 21);
				zz22 <= zz21 - atan21;
			end

		if (zz22[31])
			begin
				re23 <= re22 + (im22 >>> 22);
				im23 <= im22 - (re22 >>> 22);
				zz23 <= zz22 + atan22;
			end
		else
			begin
				re23 <= re22 - (im22 >>> 22);
				im23 <= im22 + (re22 >>> 22);
				zz23 <= zz22 - atan22;
			end

		if (zz23[31])
			begin
				re24 <= re23 + (im23 >>> 23);
				im24 <= im23 - (re23 >>> 23);
				zz24 <= zz23 + atan23;
			end
		else
			begin
				re24 <= re23 - (im23 >>> 23);
				im24 <= im23 + (re23 >>> 23);
				zz24 <= zz23 - atan23;
			end

		if (zz24[31])
			begin
				re25 <= re24 + (im24 >>> 24);
				im25 <= im24 - (re24 >>> 24);
				zz25 <= zz24 + atan24;
			end
		else
			begin
				re25 <= re24 - (im24 >>> 24);
				im25 <= im24 + (re24 >>> 24);
				zz25 <= zz24 - atan24;
			end

		if (zz25[31])
			begin
				re26 <= re25 + (im25 >>> 25);
				im26 <= im25 - (re25 >>> 25);
				zz26 <= zz25 + atan25;
			end
		else
			begin
				re26 <= re25 - (im25 >>> 25);
				im26 <= im25 + (re25 >>> 25);
				zz26 <= zz25 - atan25;
			end

		if (zz26[31])
			begin
				re27 <= re26 + (im26 >>> 26);
				im27 <= im26 - (re26 >>> 26);
				zz27 <= zz26 + atan26;
			end
		else
			begin
				re27 <= re26 - (im26 >>> 26);
				im27 <= im26 + (re26 >>> 26);
				zz27 <= zz26 - atan26;
			end

		if (zz27[31])
			begin
				re28 <= re27 + (im27 >>> 27);
				im28 <= im27 - (re27 >>> 27);
				zz28 <= zz27 + atan27;
			end
		else
			begin
				re28 <= re27 - (im27 >>> 27);
				im28 <= im27 + (re27 >>> 27);
				zz28 <= zz27 - atan27;
			end

		if (zz28[31])
			begin
				re29 <= re28 + (im28 >>> 28);
				im29 <= im28 - (re28 >>> 28);
				zz29 <= zz28 + atan28;
			end
		else
			begin
				re29 <= re28 - (im28 >>> 28);
				im29 <= im28 + (re28 >>> 28);
				zz29 <= zz28 - atan28;
			end

		if (zz29[31])
			begin
				re30 <= re29 + (im29 >>> 29);
				im30 <= im29 - (re29 >>> 29);
				zz30 <= zz29 + atan29;
			end
		else
			begin
				re30 <= re29 - (im29 >>> 29);
				im30 <= im29 + (re29 >>> 29);
				zz30 <= zz29 - atan29;
			end

		if (zz30[31])
			begin
				re31 <= re30 + (im30 >>> 30);
				im31 <= im30 - (re30 >>> 30);
				//zz31 <= zz30 + atan30;

			end
		else
			begin
				re31 <= re30 - (im30 >>> 30);
				im31 <= im30 + (re30 >>> 30);
				//zz31 <= zz30 - atan30;
				
			end
	end

endmodule
