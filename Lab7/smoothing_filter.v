module smoothing_filter(
	input c0_sig,
	input [15:0] data_x,
	input [1:0] filtLength,
	input enable,
	output [15:0] smooth_out
);
reg [15:0] smooth_outreg;
// define shift register 256 bits to store 16 samples
// at very first clock cycle data_x = 
reg [15:0] reg0; reg [15:0] reg1; reg [15:0] reg2; reg [15:0] reg3;
reg [15:0] reg4; reg [15:0] reg5; reg [15:0] reg6; reg [15:0] reg7;
reg [15:0] reg8; reg [15:0] reg9; reg [15:0] reg10; reg [15:0] reg11;
reg [15:0] reg12; reg [15:0] reg13; reg [15:0] reg14; reg [15:0] reg15;

// generate a 50 hz signal, if 50hz signal is high with 25 mhz clock, then do shift register

always @(*) begin

		
	if (enable == 1'b1) begin // Every 50 hz, this is high
	
		if (filtLength == 2'b00) begin
			smooth_outreg = data_x;
		end
		
		if (filtLength == 2'b01) begin
			smooth_outreg = (reg0+reg1) >> 1'b1; //reg0 + reg1
		end
		
		if (filtLength == 2'b10) begin
			smooth_outreg = (reg0+reg1+reg2+reg3) >> 2'b10;
		end
		
		if (filtLength == 2'b11) begin
			smooth_outreg = (reg0+reg1+reg2+reg3+reg4+reg5+reg6+reg7+reg8+reg9+reg10+reg11+reg12+reg13+reg14+reg15) >> 3'b100;
		end
	end
end

// when 50 hz is high, then sample the output from smoothing filter
always @(posedge enable) begin
	reg0<= #1 data_x;
	reg1<= #1 reg0;
	reg2<= #1 reg1;
	reg3<= #1 reg2;
	reg4<= #1 reg3;
	reg5<= #1 reg4;
	reg6<= #1 reg5;
	reg7<= #1 reg6;
	reg8<= #1 reg7;
	reg9<= #1 reg8;
	reg10<= #1 reg9;
	reg11<= #1 reg10;
	reg12<= #1 reg11;
	reg13<= #1 reg12;
	reg14<= #1 reg13;
	reg15<= #1 reg14;
end

assign smooth_out = smooth_outreg;
endmodule