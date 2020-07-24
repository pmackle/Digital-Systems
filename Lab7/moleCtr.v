module moleCtr(
		input			 clk,
		input			 enable,
		output reg [9:0] moleLED
);

reg [3:0] moleLED_c; reg [3:0] moleLED4;


initial begin
	moleLED4 = 4'b0000;
	moleLED = 10'b0000000000;
end

always @(*) begin
	moleLED_c = moleLED4;


	if (moleLED_c != 4'b1010) begin // If moleLED is not equal to 10
		moleLED_c = moleLED4 + 4'b0001;
	end
	
	if (moleLED_c == 4'b1010) begin // If moleLED is equal to 10
		moleLED_c = 4'b0000;
	end
	
	if (enable == 1'b1) begin // If enable, sample the moleLED value
	case (moleLED4) // This makes the 4 bit moleLED4 value into a 10 bit one-hot output. Where the 1 value is the LED that is on
		4'b0000:	moleLED = 10'b0000000001;
		4'b0001: moleLED = 10'b0000000010;
		4'b0010: moleLED = 10'b0000000100;
		4'b0011: moleLED = 10'b0000001000;
		4'b0100: moleLED = 10'b0000010000;
		4'b0101: moleLED = 10'b0000100000;
		4'b0110: moleLED = 10'b0001000000;
		4'b0111: moleLED = 10'b0010000000;
		4'b1000: moleLED = 10'b0100000000;
		4'b1001: moleLED = 10'b1000000000;
	endcase
	end
end

always @(posedge clk) begin
	moleLED4 <= #1 moleLED_c;
end

endmodule

// Add enable signal so it stops the moleLED value and I can sample it