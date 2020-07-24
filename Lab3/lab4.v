
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================
//Moving LEDs along board
module lab4(

	//////////// KEY //////////
	input 		     [1:0]		KEY,

	//////////// LED //////////
	output	reg	     [9:0]		LEDR,

	//////////// SW //////////

	input 		     [9:0]		SW,
	
	output reg			[9:0] d_o
);
	// posedge, assign to key0, so then I can do always @posedge

//=======================================================
//  REG/WIRE declarations
//=======================================================

always @(posedge ~KEY[0]) begin
	if (LEDR == 10'b0000000000)
	d_o = 10'b1000000000;
	else if (~KEY[1])
	d_o = SW;
	else
	d_o = {1'b0, d_o[9:1]};
	
	LEDR <= d_o;
end
	

//=======================================================
//  Structural coding
//=======================================================

	// d can be zero or one, will depend on if the rightmost 


endmodule

