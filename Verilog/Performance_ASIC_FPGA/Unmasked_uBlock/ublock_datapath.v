`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/09 21:49:00
// Design Name: 
// Module Name: ublock_datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module ublock_datapath(clk, rst, en, data_in, key_in, data_out, done);
	input clk;
	input rst;
	input en;
	input [3:0] data_in;
	input [3:0] key_in;
	output [3:0] data_out;
	output done;

    parameter [5:0] state_cnt_0 = 6'b000000;
	parameter [5:0] state_cnt_1 = 6'b000001;
	parameter [5:0] state_cnt_2 = 6'b000010;
	parameter [5:0] state_cnt_3 = 6'b000011;
	parameter [5:0] state_cnt_4 = 6'b000100;
	parameter [5:0] state_cnt_5 = 6'b000101;
	parameter [5:0] state_cnt_6 = 6'b000110;
	parameter [5:0] state_cnt_7 = 6'b000111;
	parameter [5:0] state_cnt_8 = 6'b001000;
	parameter [5:0] state_cnt_9 = 6'b001001;
	parameter [5:0] state_cnt_10 = 6'b001010;
	parameter [5:0] state_cnt_11 = 6'b001011;
	parameter [5:0] state_cnt_12 = 6'b001100;
	parameter [5:0] state_cnt_13 = 6'b001101;
	parameter [5:0] state_cnt_14 = 6'b001110;
	parameter [5:0] state_cnt_15 = 6'b001111;
	parameter [5:0] state_cnt_16 = 6'b010000;
	parameter [5:0] state_cnt_17 = 6'b010001;
	parameter [5:0] state_cnt_18 = 6'b010010;
	parameter [5:0] state_cnt_19 = 6'b010011;
	parameter [5:0] state_cnt_20 = 6'b010100;
	parameter [5:0] state_cnt_21 = 6'b010101;
	parameter [5:0] state_cnt_22 = 6'b010110;
	parameter [5:0] state_cnt_23 = 6'b010111;
	parameter [5:0] state_cnt_24 = 6'b011000;
	parameter [5:0] state_cnt_25 = 6'b011001;
	parameter [5:0] state_cnt_26 = 6'b011010;
	parameter [5:0] state_cnt_27 = 6'b011011;
	parameter [5:0] state_cnt_28 = 6'b011100;
	parameter [5:0] state_cnt_29 = 6'b011101;
	parameter [5:0] state_cnt_30 = 6'b011110;
	parameter [5:0] state_cnt_31 = 6'b011111;
	parameter [5:0] state_cnt_32 = 6'b100000;
	parameter [5:0] state_cnt_33 = 6'b100001;
	parameter [5:0] state_cnt_34 = 6'b100010;
	parameter [5:0] state_cnt_35 = 6'b100011;
	parameter [5:0] state_cnt_36 = 6'b100100;
	parameter [5:0] state_cnt_37 = 6'b100101;
	parameter [5:0] state_cnt_38 = 6'b100110;
	parameter [5:0] state_cnt_39 = 6'b100111;
	parameter [5:0] state_cnt_40 = 6'b101000;
	parameter [5:0] state_cnt_41 = 6'b101001;
	
	parameter [5:0] state_cnt_42 = 6'b101010;
	parameter [5:0] state_cnt_43 = 6'b101011;
	parameter [5:0] state_cnt_44 = 6'b101100;
	parameter [5:0] state_cnt_45 = 6'b101101;
	parameter [5:0] state_cnt_46 = 6'b101110;
	parameter [5:0] state_cnt_47 = 6'b101111;
	parameter [5:0] state_cnt_48 = 6'b110000;
	parameter [5:0] state_cnt_49 = 6'b110001;
	
	parameter [5:0] state_cnt_50 = 6'b110010;
	parameter [5:0] state_cnt_51 = 6'b110011;
	parameter [5:0] state_cnt_52 = 6'b110100;
	parameter [5:0] state_cnt_53 = 6'b110101;
	parameter [5:0] state_cnt_54 = 6'b110110;
	parameter [5:0] state_cnt_55 = 6'b110111;

	parameter [5:0] state_cnt_56 = 6'b111000;
	parameter [5:0] state_cnt_57 = 6'b111001;
	parameter [5:0] state_cnt_58 = 6'b111010;
	parameter [5:0] state_cnt_59 = 6'b111011;
	parameter [5:0] state_cnt_60 = 6'b111100;
	
	wire done;
	wire [3:0] data_out;
	reg [3:0] s00,s01,s02,s03,s04,s05,s06,s07,s10,s11,s12,s13,s14,s15,s16,s17;
	reg [3:0] s20,s21,s22,s23,s24,s25,s26,s27,s30,s31,s32,s33,s34,s35,s36,s37;
	
	reg [3:0] k00,k01,k02,k03,k04,k05,k06,k07,k10,k11,k12,k13,k14,k15,k16,k17;
	reg [3:0] k20,k21,k22,k23,k24,k25,k26,k27,k30,k31,k32,k33,k34,k35,k36,k37;
	
	reg [3:0] sbox_out0, sbox_out1, sbox_out2, sbox_out3;
	reg [3:0] temp_4_in, temp_8_in, temp_12_in;
	reg [5:0] state;
	reg [5:0] next_state;
	wire frist_round; 
	wire last_round;
	wire frist_round_ctr;
	reg  sin_frist_round_ctr;

	reg [3:0] temp_4_value0, temp_4_value1;
	reg [3:0] temp_8_value0, temp_8_value1;
	reg [3:0] temp_12_value0, temp_12_value1, temp_12_value2;
	
	reg sin_ctr0,sin_ctr1,sin_ctr2,sin_ctr3; 
	reg kin_ctr0,kin_ctr1,kin_ctr2;
	reg round_num;
	
	wire [3:0] sbox_out;
	reg  [3:0] sbox_in;
	wire [7:0] rand_num;
	reg  [3:0] st_out;
	reg [3:0] rkey;

	
	always @(posedge clk) begin
	if(!rst)
		state <= state_cnt_0;
	else
		state <= next_state;
	 end
	
    always @(*) case(state)
		state_cnt_0: next_state   = en ? state_cnt_1 : state_cnt_0;
		state_cnt_1: next_state  = state_cnt_2; 
		state_cnt_2: next_state  = state_cnt_3; 
		state_cnt_3: next_state  = state_cnt_4;
		state_cnt_4: next_state  = state_cnt_5; 
		state_cnt_5: next_state  = state_cnt_6; 
		state_cnt_6: next_state  = state_cnt_7;
		state_cnt_7: next_state  = state_cnt_8; 
		
		state_cnt_8: next_state  = state_cnt_9; 
		state_cnt_9: next_state  = state_cnt_10;
		state_cnt_10: next_state = state_cnt_11; 
		state_cnt_11: next_state = state_cnt_12; 
		state_cnt_12: next_state = state_cnt_13;
		state_cnt_13: next_state = state_cnt_14; 
		state_cnt_14: next_state = state_cnt_15; 
		state_cnt_15: next_state = state_cnt_16;
		
		state_cnt_16: next_state = state_cnt_17; 
		state_cnt_17: next_state = state_cnt_18; 
		state_cnt_18: next_state = state_cnt_19;
		state_cnt_19: next_state = state_cnt_20; 
		state_cnt_20: next_state = state_cnt_21; 
		state_cnt_21: next_state = state_cnt_22;
		state_cnt_22: next_state = state_cnt_23; 
		state_cnt_23: next_state = state_cnt_24;
		
		state_cnt_24: next_state = state_cnt_25;
		state_cnt_25: next_state = state_cnt_26; 
		state_cnt_26: next_state = state_cnt_27; 
		state_cnt_27: next_state = state_cnt_28;
		state_cnt_28: next_state = state_cnt_29; 
		state_cnt_29: next_state = state_cnt_30; 
		state_cnt_30: next_state = state_cnt_31;
		state_cnt_31: next_state = state_cnt_32; 
		
		state_cnt_32: next_state = state_cnt_33; 
		state_cnt_33: next_state = state_cnt_34;
		state_cnt_34: next_state = state_cnt_35; 
		state_cnt_35: next_state = state_cnt_36;  
		state_cnt_36: next_state = state_cnt_37; 
		state_cnt_37: next_state = state_cnt_38;
		state_cnt_38: next_state = state_cnt_39; 
		state_cnt_39: next_state = state_cnt_40;  
		
		state_cnt_40: next_state = state_cnt_41; 
		state_cnt_41: next_state = state_cnt_42; 
		state_cnt_42: next_state = state_cnt_43; 
		state_cnt_43: next_state = state_cnt_44; 
		state_cnt_44: next_state = state_cnt_45; 
		state_cnt_45: next_state = state_cnt_46; 
		state_cnt_46: next_state = state_cnt_47; 
		state_cnt_47: next_state = state_cnt_48; 
		 
		state_cnt_48: next_state = state_cnt_49; 
		state_cnt_49: next_state = state_cnt_50; 
		state_cnt_50: next_state = state_cnt_51; 
		state_cnt_51: next_state = state_cnt_52; 
		state_cnt_52: next_state = state_cnt_53;
		state_cnt_53: next_state = state_cnt_54;
		state_cnt_54: next_state = state_cnt_55; 
		state_cnt_55: next_state = state_cnt_56; 
		state_cnt_56: next_state = state_cnt_57; 
		state_cnt_57: next_state = state_cnt_58;
		state_cnt_58: next_state = state_cnt_59;
		state_cnt_59: next_state = state_cnt_60;
		state_cnt_60: next_state =  state_cnt_2; 
		//state_cnt_60: next_state = last_round ? state_cnt_0 : state_cnt_2; // 是否最后一轮判断，进入到state0停止。
		default: next_state      = 6'b000000;
    endcase 


	always @(posedge clk) begin
	if(!rst)
		round_num <= 1'b0;
	else if (next_state == state_cnt_2) 
	    round_num <= 1'b1;
    else 
        round_num <= 1'b0; 
	end

	always @(posedge clk) begin
	  if (!rst) begin
		  s00 <= 4'b0000;
		  s01 <= 4'b0000;
		  s02 <= 4'b0000;
		  s03 <= 4'b0000;
		  s04 <= 4'b0000;
		  s05 <= 4'b0000;
		  s06 <= 4'b0000;
		  s07 <= 4'b0000;
		  s10 <= 4'b0000;
		  s11 <= 4'b0000;
		  s12 <= 4'b0000;
		  s13 <= 4'b0000;
		  s14 <= 4'b0000;
		  s15 <= 4'b0000;
		  s16 <= 4'b0000;
		  s17 <= 4'b0000;
		  s20 <= 4'b0000;
		  s21 <= 4'b0000;
		  s22 <= 4'b0000;
		  s23 <= 4'b0000;
		  s24 <= 4'b0000;
		  s25 <= 4'b0000;
		  s26 <= 4'b0000;
		  s27 <= 4'b0000;
		  s30 <= 4'b0000;
		  s31 <= 4'b0000;
		  s32 <= 4'b0000;
		  s33 <= 4'b0000;
		  s34 <= 4'b0000;
		  s35 <= 4'b0000;
		  s36 <= 4'b0000;
		  s37 <= 4'b0000;
	  end
	  else begin 
	  if (state == state_cnt_60) begin
		  s07 <= s02;
		  s06 <= s01;
		  s05 <= s06;
		  s04 <= s05;
		  s03 <= s14;
		  s02 <= s13;
		  s01 <= s10;
		  s00 <= s17;
		  s17 <= s04;
		  s16 <= s03;
		  s15 <= s00;
		  s14 <= s07;
		  s13 <= s16;
		  s12 <= s15;
		  s11 <= s12;
		  s10 <= s11;
		  s27 <= s21;
		  s26 <= s20;
		  s25 <= s37;
		  s24 <= s36;
		  s23 <= s33;
		  s22 <= s32;
		  s21 <= s25;
		  s20 <= s24;
		  s37 <= s23;
		  s36 <= s22;
		  s35 <= s31;
		  s34 <= s30;
		  s33 <= s35;
		  s32 <= s34;
		  s31 <= s27;
		  s30 <= s26;
	  end
	  else begin
	      s00 <= sin_ctr0 ? sbox_out0 : s07;
		  s01 <= s00;
		  s02 <= s01;
		  s03 <= s02;
		  s04 <= s03;
		  s05 <= s04;
		  s06 <= s05;
		  s07 <= s06;
		  s10 <= sin_ctr1 ? sbox_out1 : s17;
		  s11 <= s10;
		  s12 <= s11;
		  s13 <= s12;
		  s14 <= s13;
		  s15 <= s14;
		  s16 <= s15;
		  s17 <= s16;
		  s20 <= sin_ctr2 ? sbox_out2 : s27;
		  s21 <= s20;
		  s22 <= s21;
		  s23 <= s22;
		  s24 <= s23;
		  s25 <= s24;
		  s26 <= s25;
		  s27 <= s26;
		  s30 <= sin_ctr3 ? sbox_out3 : s37;
		  s31 <= s30;
		  s32 <= s31;
		  s33 <= s32;
		  s34 <= s33;
		  s35 <= s34;
		  s36 <= s35;
		  s37 <= s36;
	  end
	end
  end

assign done = last_round & round_num;

  LFSR lsr (clk, rst, round_num, frist_round, last_round, rand_num);

assign data_out = ((kin_ctr0 == 1'b1) || (state == state_cnt_33) )? sbox_in : s37;

assign frist_round_ctr = ((frist_round ^ round_num) || (frist_round ^  sin_frist_round_ctr)) && frist_round;	 

    always @(posedge clk) begin
	if(!rst)
		sin_frist_round_ctr <= 1'b0;
	else if (rand_num == 8'b00011011) 
	    sin_frist_round_ctr <= 1'b1;
    else 
        sin_frist_round_ctr <= 1'b0; 
	end

  always @(*) case(state)
		  state_cnt_2,state_cnt_3,state_cnt_4,state_cnt_5,state_cnt_6,state_cnt_7,state_cnt_8,state_cnt_9:
		    sbox_in = (frist_round_ctr == 1'b1) ? data_in ^ key_in : s07 ^ k37;
		  state_cnt_10,state_cnt_11,state_cnt_12,state_cnt_13,state_cnt_14,state_cnt_15,state_cnt_16,state_cnt_17:
            sbox_in = (frist_round_ctr == 1'b1) ? data_in ^ key_in : s17 ^ k37;
		  state_cnt_18,state_cnt_19,state_cnt_20,state_cnt_21,state_cnt_22,state_cnt_23,state_cnt_24,state_cnt_25:
		    sbox_in = (frist_round_ctr == 1'b1) ? data_in ^ key_in : s27 ^ k37;
		  state_cnt_26,state_cnt_27,state_cnt_28,state_cnt_29,state_cnt_30,state_cnt_31,state_cnt_32,state_cnt_33:
		    sbox_in = (frist_round_ctr == 1'b1) ? data_in ^ key_in : s37 ^ k37;

		  state_cnt_34:
		     sbox_in = {rand_num[0],~rand_num[1],rand_num[2],rand_num[3]}  ^ k37;  
		  state_cnt_35:
		     sbox_in = {rand_num[4],rand_num[5],rand_num[6],rand_num[7]}   ^ k37; 
		  state_cnt_36:
		     sbox_in = {rand_num[0],~rand_num[1],rand_num[2],~rand_num[3]} ^ k37; 
		  state_cnt_37:
		     sbox_in = {rand_num[4],~rand_num[5],rand_num[6],rand_num[7]}  ^ k37; 
		  state_cnt_38:
		     sbox_in = {rand_num[0],rand_num[1],rand_num[2],~rand_num[3]}  ^ k37; 
		  state_cnt_39:
		     sbox_in = {rand_num[4],rand_num[5],rand_num[6],~rand_num[7]}  ^ k37; 
		  state_cnt_40:
		     sbox_in = {rand_num[0],rand_num[1],rand_num[2],rand_num[3]}   ^ k37; 
		  state_cnt_41:
             sbox_in = {rand_num[4],~rand_num[5],rand_num[6],~rand_num[7]} ^ k37; 
		  default :
			  sbox_in = 4'b0000;
	endcase
	
	sbox sb (sbox_in, sbox_out);


  always @(posedge clk) begin
	  if (!rst) begin
		  temp_4_value0 <= 4'b0000;
		  temp_4_value1 <= 4'b0000;
	  end
	  else 
		  begin
		  temp_4_value0 <= temp_4_in;
		  temp_4_value1 <= temp_4_value0;

	  end
  end
  
  always @(posedge clk) begin
	  if (!rst) begin
		  temp_8_value0 <= 4'b0000;
		  temp_8_value1 <= 4'b0000;
	  end
	  else 
		  begin
		  temp_8_value0 <= temp_8_in;
		  temp_8_value1 <= temp_8_value0;
	  end
  end

  always @(posedge clk) begin
	  if (!rst) begin
		  temp_12_value0 <= 4'b0000;
		  temp_12_value1 <= 4'b0000;
		  temp_12_value2 <= 4'b0000;
	  end
	  else 
		  begin
		  temp_12_value0 <= temp_12_in;
		  temp_12_value1 <= temp_12_value0;
		  temp_12_value2 <= temp_12_value1;
	  end
  end

	always @(*) case(state)
		  state_cnt_2,state_cnt_3,state_cnt_4,state_cnt_5,state_cnt_6,state_cnt_7,state_cnt_8,state_cnt_9,
		  state_cnt_20,state_cnt_21,state_cnt_22,state_cnt_23,state_cnt_24,state_cnt_25,state_cnt_26,state_cnt_27,
		  state_cnt_31,state_cnt_32,state_cnt_33,state_cnt_34,state_cnt_35,state_cnt_36,state_cnt_37,state_cnt_38,
		  state_cnt_44,state_cnt_45,state_cnt_46,state_cnt_47,state_cnt_48,state_cnt_49,state_cnt_50,state_cnt_51:
			  sin_ctr0 = 1'b1;
		  default :
			  sin_ctr0 = 1'b0;
	endcase
	
	always @(*) case(state)
		  state_cnt_10,state_cnt_11,state_cnt_12,state_cnt_13,state_cnt_14,state_cnt_15,state_cnt_16,state_cnt_17,
		  state_cnt_28,state_cnt_29,state_cnt_30,state_cnt_31,state_cnt_32,state_cnt_33,state_cnt_34,state_cnt_35,
		  state_cnt_39,state_cnt_40,state_cnt_41,state_cnt_42,state_cnt_43,state_cnt_44,state_cnt_45,state_cnt_46,
		  state_cnt_52,state_cnt_53,state_cnt_54,state_cnt_55,state_cnt_56,state_cnt_57,state_cnt_58,state_cnt_59:
			  sin_ctr1 = 1'b1;
		  default :
			  sin_ctr1 = 1'b0;
	endcase
	
	always @(*) case(state)
		  state_cnt_18,state_cnt_19,state_cnt_20,state_cnt_21,state_cnt_22,state_cnt_23,state_cnt_24,state_cnt_25,
		  state_cnt_28,state_cnt_29,state_cnt_30,state_cnt_31,state_cnt_32,state_cnt_33,state_cnt_34,state_cnt_35,
		  state_cnt_38,state_cnt_39,state_cnt_40,state_cnt_41,state_cnt_42,state_cnt_43,state_cnt_44,state_cnt_45:
			  sin_ctr2 = 1'b1;
		  default :
			  sin_ctr2 = 1'b0;
	endcase
	
	 always @(*) case(state)
		  state_cnt_26,state_cnt_27,state_cnt_28,state_cnt_29,state_cnt_30,state_cnt_31,state_cnt_32,state_cnt_33,
		  state_cnt_36,state_cnt_37,state_cnt_38,state_cnt_39,state_cnt_40,state_cnt_41,state_cnt_42,state_cnt_43,
		  state_cnt_46,state_cnt_47,state_cnt_48,state_cnt_49,state_cnt_50,state_cnt_51,state_cnt_52,state_cnt_53:  
			  sin_ctr3 = 1'b1;
		  default :
			  sin_ctr3 = 1'b0;
	endcase
	
	always @(*) case(state)
		  state_cnt_18,state_cnt_19,state_cnt_20,state_cnt_21,state_cnt_22,state_cnt_23,state_cnt_24,state_cnt_25:
			  temp_4_in = s07;
		  state_cnt_26,state_cnt_27,state_cnt_28,state_cnt_29,state_cnt_30,state_cnt_31,state_cnt_32,state_cnt_33:
			  temp_4_in = s17;
		  state_cnt_36,state_cnt_37,state_cnt_38,state_cnt_39,state_cnt_40,state_cnt_41,state_cnt_42,state_cnt_43:
			  temp_4_in = s27;
		  state_cnt_44,state_cnt_45,state_cnt_46,state_cnt_47,state_cnt_48,state_cnt_49,state_cnt_50,state_cnt_51:
			  temp_4_in = s37;
		  default :
			  temp_4_in = 4'b0000;
	endcase
	
	always @(*) case(state)
		  state_cnt_26,state_cnt_27,state_cnt_28,state_cnt_29,state_cnt_30,state_cnt_31,state_cnt_32,state_cnt_33:
			  temp_8_in = s27;
		  state_cnt_34,state_cnt_35,state_cnt_36,state_cnt_37,state_cnt_38,state_cnt_39,state_cnt_40,state_cnt_41:
			  temp_8_in = s37;
		  default :
			  temp_8_in = 4'b0000;
	endcase

   always @(*) case(state)
		  state_cnt_28,state_cnt_29,state_cnt_30,state_cnt_31,state_cnt_32,state_cnt_33,state_cnt_34,state_cnt_35:
			  temp_12_in = s07;
		  state_cnt_36,state_cnt_37,state_cnt_38,state_cnt_39,state_cnt_40,state_cnt_41,state_cnt_42,state_cnt_43:
			  temp_12_in = s17;
		  default :
			  temp_12_in = 4'b0000;
	endcase
	 
	always @(*) case(state)
		  state_cnt_2,state_cnt_3,state_cnt_4,state_cnt_5,state_cnt_6,state_cnt_7,state_cnt_8,state_cnt_9:
			  sbox_out0 = sbox_out;
		  state_cnt_20,state_cnt_21,state_cnt_22,state_cnt_23,state_cnt_24,state_cnt_25,state_cnt_26,state_cnt_27:
			  sbox_out0 = temp_4_value1 ^ s20;
		  state_cnt_31,state_cnt_32,state_cnt_33,state_cnt_34,state_cnt_35,state_cnt_36,state_cnt_37,state_cnt_38:
			  sbox_out0 = temp_12_value2 ^ s20;
		  state_cnt_44,state_cnt_45,state_cnt_46,state_cnt_47,state_cnt_48,state_cnt_49,state_cnt_50,state_cnt_51:
			  sbox_out0 = s07 ^ s20;
		  default :
			  sbox_out0 = 4'b0000;
	endcase
	
	always @(*) case(state)
		  state_cnt_10,state_cnt_11,state_cnt_12,state_cnt_13,state_cnt_14,state_cnt_15,state_cnt_16,state_cnt_17:
			  sbox_out1 = sbox_out;
		  state_cnt_28,state_cnt_29,state_cnt_30,state_cnt_31,state_cnt_32,state_cnt_33,state_cnt_34,state_cnt_35:
			  sbox_out1 = temp_4_value1 ^ s30;
		  state_cnt_39,state_cnt_40,state_cnt_41,state_cnt_42,state_cnt_43,state_cnt_44,state_cnt_45,state_cnt_46:
			  sbox_out1 = temp_12_value2 ^ s30;
		  state_cnt_52,state_cnt_53,state_cnt_54,state_cnt_55,state_cnt_56,state_cnt_57,state_cnt_58,state_cnt_59:
			  sbox_out1 = s17 ^ s30;
		  default :
			  sbox_out1 = 4'b0000;
	endcase
  
	always @(*) case(state)
		  state_cnt_18,state_cnt_19,state_cnt_20,state_cnt_21,state_cnt_22,state_cnt_23,state_cnt_24,state_cnt_25:
			  sbox_out2 = sbox_out ^ s07;
		  state_cnt_28,state_cnt_29,state_cnt_30,state_cnt_31,state_cnt_32,state_cnt_33,state_cnt_34,state_cnt_35:
			  sbox_out2 = s05 ^ temp_8_value1;
		  state_cnt_38,state_cnt_39,state_cnt_40,state_cnt_41,state_cnt_42,state_cnt_43,state_cnt_44,state_cnt_45:
			  sbox_out2 = s01 ^ temp_4_value1;
		  default :
			  sbox_out2 = 4'b0000;
	endcase
	
	always @(*) case(state)
			state_cnt_26,state_cnt_27,state_cnt_28,state_cnt_29,state_cnt_30,state_cnt_31,state_cnt_32,state_cnt_33:
			  sbox_out3 = sbox_out ^ s17;
			state_cnt_36,state_cnt_37,state_cnt_38,state_cnt_39,state_cnt_40,state_cnt_41,state_cnt_42,state_cnt_43:
			  sbox_out3 = s15 ^ temp_8_value1;
			state_cnt_46,state_cnt_47,state_cnt_48,state_cnt_49,state_cnt_50,state_cnt_51,state_cnt_52,state_cnt_53:
			  sbox_out3 = s11 ^ temp_4_value1;
		  default :
			  sbox_out3 = 4'b0000;
	endcase

  always @(posedge clk) begin
	if(!rst)
		rkey <= 4'b0000;
	else 
	    rkey <= key_in;
	end

  /////////////////////////////////keygen///////////////////
  	always @(posedge clk) begin
	  if (!rst) begin
		  k00 <= 4'b0000;
		  k01 <= 4'b0000;
		  k02 <= 4'b0000;
		  k03 <= 4'b0000;
		  k04 <= 4'b0000;
		  k05 <= 4'b0000;
		  k06 <= 4'b0000;
		  k07 <= 4'b0000;
		  k10 <= 4'b0000;
		  k11 <= 4'b0000;
		  k12 <= 4'b0000;
		  k13 <= 4'b0000;
		  k14 <= 4'b0000;
		  k15 <= 4'b0000;
		  k16 <= 4'b0000;
		  k17 <= 4'b0000;
		  k20 <= 4'b0000;
		  k21 <= 4'b0000;
		  k22 <= 4'b0000;
		  k23 <= 4'b0000;
		  k24 <= 4'b0000;
		  k25 <= 4'b0000;
		  k26 <= 4'b0000;
		  k27 <= 4'b0000;
		  k30 <= 4'b0000;
		  k31 <= 4'b0000;
		  k32 <= 4'b0000;
		  k33 <= 4'b0000;
		  k34 <= 4'b0000;
		  k35 <= 4'b0000;
		  k36 <= 4'b0000;
		  k37 <= 4'b0000;
	  end
	  else if (kin_ctr0 == 1'b1) 
		  begin
		  k00 <= (frist_round_ctr == 1'b1) ? rkey : k37;
		  k01 <= k00;
		  k02 <= k01;
		  k03 <= k02;
		  k04 <= k03;
		  k05 <= k04;
		  k06 <= k05;
		  k07 <= k06;
		  k10 <= k07;
		  k11 <= k10;
		  k12 <= k11;
		  k13 <= k12;
		  k14 <= k13;
		  k15 <= k14;
		  k16 <= k15;
		  k17 <= k16;
		  k20 <= k17;
		  k21 <= k20;
		  k22 <= k21;
		  k23 <= k22;
		  k24 <= k23;
		  k25 <= k24;
		  k26 <= k25;
		  k27 <= k26;
		  k30 <= k27;
		  k31 <= k30;
		  k32 <= k31;
		  k33 <= k32;
		  k34 <= k33;
		  k35 <= k34;
		  k36 <= k35;
		  k37 <= k36;
	  end
      else if (state == state_cnt_33) 
	      begin
	      k00 <= (frist_round_ctr == 1'b1) ? rkey : k37;
		  k01 <= k00;
		  k02 <= k01;
		  k03 <= k02;
		  k04 <= k03;
		  k05 <= k04;
		  k06 <= k05;
		  k07 <= k06;
		  k10 <= k07;
		  k11 <= k10;
		  k12 <= k11;
		  k13 <= k12;
		  k14 <= k13;
		  k15 <= k14;
		  k16 <= k15;
		  k17 <= k16;
		  k20 <= k20;
		  k21 <= k27;
		  k22 <= k33;
		  k23 <= k23;
		  k24 <= k34;
		  k25 <= k22;
		  k26 <= k25;
		  k27 <= k32;
		  k30 <= k24;
		  k31 <= k31;
		  k32 <= k17;
		  k33 <= k35;
		  k34 <= k21;
		  k35 <= k26;
		  k36 <= k36;
		  k37 <= k30; 
	      end
      else if (kin_ctr1 == 1'b1) 
	      begin
	      k30 <= k37;
		  k31 <= k30;
		  k32 <= k31;
		  k33 <= k32;
		  k34 <= k33;
		  k35 <= k34;
		  k36 <= k35;
		  k37 <= k36;
		  k10 <= st_out;
		  k11 <= k10;
		  k12 <= k11;
		  k13 <= k12;
		  k14 <= k13;
		  k15 <= k14;
		  k16 <= k15;
		  k17 <= k16;   
	      end
	  else if (kin_ctr2 == 1'b1) 
	      begin
	      k20 <= k27;
		  k21 <= k20;
		  k22 <= k21;
		  k23 <= k22;
		  k24 <= k23;
		  k25 <= k24;
		  k26 <= k25;
		  k27 <= k26;
		  k00 <= st_out;
		  k01 <= k00;
		  k02 <= k01;
		  k03 <= k02;
		  k04 <= k03;
		  k05 <= k04;
		  k06 <= k05;
		  k07 <= k06;   
	      end
	  else if (state == state_cnt_50)
	      begin
	      k00 <= k30;
		  k01 <= k31;
		  k02 <= k32;
		  k03 <= k33;
		  k04 <= k34;
		  k05 <= k35;
		  k06 <= k36;
		  k07 <= k37; 
		  k10 <= k20;
		  k11 <= k21;
		  k12 <= k22;
		  k13 <= k23;
		  k14 <= k24;
		  k15 <= k25;
		  k16 <= k26;
		  k17 <= k27; 
		  k20 <= k00;
		  k21 <= k01;
		  k22 <= k02;
		  k23 <= k03;
		  k24 <= k04;
		  k25 <= k05;
		  k26 <= k06;
		  k27 <= k07; 
		  k30 <= k10;
		  k31 <= k11;
		  k32 <= k12;
		  k33 <= k13;
		  k34 <= k14;
		  k35 <= k15;
		  k36 <= k16;
		  k37 <= k17;   
	      end
  end

 /////////////////test data_out//////////////////
wire [3:0] key_out;
assign key_out = k37;
/////////////////////////////////////////////////////

	always @(*) case(state)
		  state_cnt_2,state_cnt_3,state_cnt_4,state_cnt_5,state_cnt_6,state_cnt_7,state_cnt_8,state_cnt_9,
		  state_cnt_10,state_cnt_11,state_cnt_12,state_cnt_13,state_cnt_14,state_cnt_15,state_cnt_16,state_cnt_17,
		  state_cnt_18,state_cnt_19,state_cnt_20,state_cnt_21,state_cnt_22,state_cnt_23,state_cnt_24,state_cnt_25,
		  state_cnt_26,state_cnt_27,state_cnt_28,state_cnt_29,state_cnt_30,state_cnt_31,state_cnt_32:
			  kin_ctr0 = 1'b1;
		  default :
			  kin_ctr0 = 1'b0;
	endcase

	always @(*) case(state)
		  state_cnt_34,state_cnt_35,state_cnt_36,state_cnt_37,state_cnt_38,state_cnt_39,state_cnt_40,state_cnt_41:
			  kin_ctr1 = 1'b1;
		  default :
			  kin_ctr1 = 1'b0;
	endcase

	always @(*) case(state)
		  state_cnt_42,state_cnt_43,state_cnt_44,state_cnt_45,state_cnt_46,state_cnt_47,state_cnt_48,state_cnt_49:
			  kin_ctr2 = 1'b1;
		  default :
			  kin_ctr2 = 1'b0;
	endcase

	always @(*) case(state)
		  state_cnt_34,state_cnt_35,state_cnt_36,state_cnt_37,state_cnt_38,state_cnt_39,state_cnt_40,state_cnt_41:
			  st_out = sbox_out ^ k17;
		  state_cnt_42,state_cnt_43,state_cnt_44,state_cnt_45,state_cnt_46,state_cnt_47,state_cnt_48,state_cnt_49:
			  st_out = {k27[2],k27[1],k27[0] ^ k27[3],k27[3]} ^ k07;
		  default :
			  st_out = 4'b0000;
	endcase


endmodule
