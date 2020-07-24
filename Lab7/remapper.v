module remapper(
	input		 [15:0] smooth_out,
	output	reg [9:0] board_posit


);
// This gives the moles position 
// Remember these are twos complement - make sure it accounts for sign input
// Could convert the negative number to positive numbers and map it to left side of LEDs
// The moles position is determined by the ring counter
// Depending on board, could be -300 to 300 or something, adjust range once I figure that out
// smooth out has the values -250 to 250, so we evenly distribute it among 10 board_posit outputs
reg [15:0] smooth_out_temp;
always @(*) begin
	if (smooth_out[15] == 1'b1) begin // If it is negative, take 2's complement and compare that number instead
		smooth_out_temp = ~smooth_out + 1'b1;
		
		if (smooth_out_temp >= 16'b0000000000000000 && smooth_out_temp < 16'b0000000000110010) // If smooth_out_temp >= 0 && smooth_out < 50
			board_posit = 10'b0000010000;
		
		if (smooth_out_temp >= 16'b0000000000110010 && smooth_out_temp < 16'b0000000001100100) // If smooth_out_temp >= 50 && smooth_out < 100
			board_posit = 10'b0000001000;
			
		if (smooth_out_temp >= 16'b0000000001100100 && smooth_out_temp < 16'b0000000010010110) // If smooth_out_temp >= 100 && smooth_out < 150
			board_posit = 10'b0000000100;
			
		if (smooth_out_temp >= 16'b0000000010010110 && smooth_out_temp < 16'b0000000011001000) // If smooth_out_temp >= 150 && smooth_out < 200
			board_posit = 10'b0000000010;
		
		if (smooth_out_temp >= 16'b0000000011001000) // If smooth_out_temp >= 200
			board_posit = 10'b0000000001;

	end
	
	else begin
	
	if (smooth_out >= 16'b0000000000000000 && smooth_out < 16'b0000000000110010) // If smooth_out >= 0 && smooth_out < 50
		board_posit = 10'b0000100000;
	
	if (smooth_out >= 16'b0000000000110010 && smooth_out < 16'b0000000001100100) // If smooth_out >= 50 && smooth_out < 100
		board_posit = 10'b0001000000;
		
	if (smooth_out >= 16'b0000000001100100 && smooth_out < 16'b0000000010010110) // If smooth_out >= 100 && smooth_out < 150
		board_posit = 10'b0010000000;
		
	if (smooth_out >= 16'b0000000010010110 && smooth_out < 16'b0000000011001000) // If smooth_out >= 150 && smooth_out < 200
		board_posit = 10'b0100000000;
	
	if (smooth_out >= 16'b0000000011001000) // If smooth_out >= 200
		board_posit = 10'b1000000000;
	
	end

end	

	

endmodule