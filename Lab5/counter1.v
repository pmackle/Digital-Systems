module counter1(
	input 			reset,
	input			enable,
	input 		[5:0] divideby,
	output reg			go,
	input					clk,
   output reg  [5:0] countTB
);
	reg					[5:0] count1 = 6'b000000;
	reg					[5:0] count1_c = 6'b000000;

always @(count1 or reset or go) begin
	count1_c = count1;
	go = 1'b0;
	
	if (count1 != (divideby - 6'b000001))begin
		count1_c =  count1 + 6'b000001;
	end
	
	if (count1 == (divideby - 6'b000001))begin
		count1_c =  6'b000000;
		go = 1;
	end

	
	if (enable == 1'b0)begin
		count1_c =  count1;
	end
	
	if (reset == 1'b1)begin
		count1_c = 6'b000000;
	end
end
	
always @(posedge clk) begin
	count1 <= #1 count1_c;
	countTB <= #1 count1_c;
end


//counter 1 instantiated in counter2
// when go and enable are high, begin counting

endmodule