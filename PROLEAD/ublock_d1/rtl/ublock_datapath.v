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
module ublock_datapath(clk, rst, en, data_in_share0, data_in_share1,  key_in_share0, key_in_share1, data_out_share0, data_out_share1, done);
    input clk;
    input rst;
    input en;
    input [3:0] data_in_share0,data_in_share1;
    input [3:0] key_in_share0,key_in_share1;
    output [3:0] data_out_share0,data_out_share1;
    output done;

    parameter [6:0] state_cnt_0 = 7'b0000000;
    parameter [6:0] state_cnt_1 = 7'b0000001;
    parameter [6:0] state_cnt_2 = 7'b0000010;
    parameter [6:0] state_cnt_3 = 7'b0000011;
    parameter [6:0] state_cnt_4 = 7'b0000100;
    parameter [6:0] state_cnt_5 = 7'b0000101;
    parameter [6:0] state_cnt_6 = 7'b0000110;
    parameter [6:0] state_cnt_7 = 7'b0000111;
    parameter [6:0] state_cnt_8 = 7'b0001000;
    parameter [6:0] state_cnt_9 = 7'b0001001;
    parameter [6:0] state_cnt_10 = 7'b0001010;
    parameter [6:0] state_cnt_11 = 7'b0001011;
    parameter [6:0] state_cnt_12 = 7'b0001100;
    parameter [6:0] state_cnt_13 = 7'b0001101;
    parameter [6:0] state_cnt_14 = 7'b0001110;
    parameter [6:0] state_cnt_15 = 7'b0001111;
    parameter [6:0] state_cnt_16 = 7'b0010000;
    parameter [6:0] state_cnt_17 = 7'b0010001;
    parameter [6:0] state_cnt_18 = 7'b0010010;
    parameter [6:0] state_cnt_19 = 7'b0010011;
    parameter [6:0] state_cnt_20 = 7'b0010100;
    parameter [6:0] state_cnt_21 = 7'b0010101;
    parameter [6:0] state_cnt_22 = 7'b0010110;
    parameter [6:0] state_cnt_23 = 7'b0010111;
    parameter [6:0] state_cnt_24 = 7'b0011000;
    parameter [6:0] state_cnt_25 = 7'b0011001;
    parameter [6:0] state_cnt_26 = 7'b0011010;
    parameter [6:0] state_cnt_27 = 7'b0011011;
    parameter [6:0] state_cnt_28 = 7'b0011100;
    parameter [6:0] state_cnt_29 = 7'b0011101;
    parameter [6:0] state_cnt_30 = 7'b0011110;
    parameter [6:0] state_cnt_31 = 7'b0011111;
    parameter [6:0] state_cnt_32 = 7'b0100000;
    parameter [6:0] state_cnt_33 = 7'b0100001;
    parameter [6:0] state_cnt_34 = 7'b0100010;
    parameter [6:0] state_cnt_35 = 7'b0100011;
    parameter [6:0] state_cnt_36 = 7'b0100100;
    parameter [6:0] state_cnt_37 = 7'b0100101;
    parameter [6:0] state_cnt_38 = 7'b0100110;
    parameter [6:0] state_cnt_39 = 7'b0100111;
    parameter [6:0] state_cnt_40 = 7'b0101000;
    parameter [6:0] state_cnt_41 = 7'b0101001;
    
    parameter [6:0] state_cnt_42 = 7'b0101010;
    parameter [6:0] state_cnt_43 = 7'b0101011;
    parameter [6:0] state_cnt_44 = 7'b0101100;
    parameter [6:0] state_cnt_45 = 7'b0101101;
    parameter [6:0] state_cnt_46 = 7'b0101110;
    parameter [6:0] state_cnt_47 = 7'b0101111;
    parameter [6:0] state_cnt_48 = 7'b0110000;
    parameter [6:0] state_cnt_49 = 7'b0110001;
    
    parameter [6:0] state_cnt_50 = 7'b0110010;
    parameter [6:0] state_cnt_51 = 7'b0110011;
    parameter [6:0] state_cnt_52 = 7'b0110100;
    parameter [6:0] state_cnt_53 = 7'b0110101;
    parameter [6:0] state_cnt_54 = 7'b0110110;
    parameter [6:0] state_cnt_55 = 7'b0110111;

    parameter [6:0] state_cnt_56 = 7'b0111000;
    parameter [6:0] state_cnt_57 = 7'b0111001;
    parameter [6:0] state_cnt_58 = 7'b0111010;
    parameter [6:0] state_cnt_59 = 7'b0111011;
    parameter [6:0] state_cnt_60 = 7'b0111100;
    parameter [6:0] state_cnt_61 = 7'b0111101;
    parameter [6:0] state_cnt_62 = 7'b0111110;
    parameter [6:0] state_cnt_63 = 7'b0111111;
    parameter [6:0] state_cnt_64 = 7'b1000000;
    parameter [6:0] state_cnt_65 = 7'b1000001;
    
    wire done;
    wire [3:0] data_out_share0,data_out_share1;
    reg [3:0] s00_share0,s01_share0,s02_share0,s03_share0,s04_share0,s05_share0,s06_share0,s07_share0;
    reg [3:0] s10_share0,s11_share0,s12_share0,s13_share0,s14_share0,s15_share0,s16_share0,s17_share0;
    reg [3:0] s20_share0,s21_share0,s22_share0,s23_share0,s24_share0,s25_share0,s26_share0,s27_share0;
    reg [3:0] s30_share0,s31_share0,s32_share0,s33_share0,s34_share0,s35_share0,s36_share0,s37_share0;

    reg [3:0] s00_share1,s01_share1,s02_share1,s03_share1,s04_share1,s05_share1,s06_share1,s07_share1;
    reg [3:0] s10_share1,s11_share1,s12_share1,s13_share1,s14_share1,s15_share1,s16_share1,s17_share1;
    reg [3:0] s20_share1,s21_share1,s22_share1,s23_share1,s24_share1,s25_share1,s26_share1,s27_share1;
    reg [3:0] s30_share1,s31_share1,s32_share1,s33_share1,s34_share1,s35_share1,s36_share1,s37_share1;
    
    reg [3:0] k00_share0,k01_share0,k02_share0,k03_share0,k04_share0,k05_share0,k06_share0,k07_share0;
    reg [3:0] k10_share0,k11_share0,k12_share0,k13_share0,k14_share0,k15_share0,k16_share0,k17_share0;
    reg [3:0] k20_share0,k21_share0,k22_share0,k23_share0,k24_share0,k25_share0,k26_share0,k27_share0;
    reg [3:0] k30_share0,k31_share0,k32_share0,k33_share0,k34_share0,k35_share0,k36_share0,k37_share0;

    reg [3:0] k00_share1,k01_share1,k02_share1,k03_share1,k04_share1,k05_share1,k06_share1,k07_share1;
    reg [3:0] k10_share1,k11_share1,k12_share1,k13_share1,k14_share1,k15_share1,k16_share1,k17_share1;
    reg [3:0] k20_share1,k21_share1,k22_share1,k23_share1,k24_share1,k25_share1,k26_share1,k27_share1;
    reg [3:0] k30_share1,k31_share1,k32_share1,k33_share1,k34_share1,k35_share1,k36_share1,k37_share1;
    
    reg [3:0] sbox_out0_share0, sbox_out1_share0, sbox_out2_share0, sbox_out3_share0;
    reg [3:0] sbox_out0_share1, sbox_out1_share1, sbox_out2_share1, sbox_out3_share1;
    reg [3:0] temp_4_in_share0, temp_8_in_share0, temp_12_in_share0;
    reg [3:0] temp_4_in_share1, temp_8_in_share1, temp_12_in_share1;
    reg [6:0] state;
    reg [6:0] next_state;
    wire frist_round; 
    wire last_round;
    wire frist_round_ctr;
    reg  sin_frist_round_ctr;

    reg [3:0] temp_4_value0_share0, temp_4_value1_share0;
    reg [3:0] temp_4_value0_share1, temp_4_value1_share1;
    reg [3:0] temp_8_value0_share0, temp_8_value1_share0;
    reg [3:0] temp_8_value0_share1, temp_8_value1_share1;
    reg [3:0] temp_12_value0_share0, temp_12_value1_share0, temp_12_value2_share0;
    reg [3:0] temp_12_value0_share1, temp_12_value1_share1, temp_12_value2_share1;
    
    reg sin_ctr0,sin_ctr1,sin_ctr2,sin_ctr3; 
    reg kin_ctr0,kin_ctr1,kin_ctr2;
    reg sbox_ctr0,sbox_ctr1,sbox_ctr2,sbox_ctr3;
    reg round_num;
    
    wire [3:0] sbox_out_share0,sbox_out_share1;
    reg  [3:0] sbox_in_share0,sbox_in_share1;
    wire [7:0] rand_num;
    reg  [3:0] st_out_share0,st_out_share1;
    reg [3:0] rdata_share0, rdata_share1;
    reg [3:0] rkey_share0,rkey_share1;

    //sbox varible
    //1 floor 
    reg g1_share0,g1_share1;
    reg g2_share0,g2_share1;
   
    reg g0_0_share0,g0_1_share0,g0_0_share1,g0_1_share1;
    reg g3_0_share0,g3_1_share0,g3_0_share1,g3_1_share1;
    
    //2 floor
    reg gg0_share0,gg0_share1;
    reg gg1_share0,gg1_share1;
    reg gg2_share0,gg2_share1;
    reg gg3_share0,gg3_share1;

    //3 floor 
    reg f0_share0,f0_share1;
    reg f3_share0,f3_share1;
   
    reg f1_0_share0,f1_1_share0,f1_0_share1,f1_1_share1;
    reg f2_0_share0,f2_1_share0,f2_0_share1,f2_1_share1;

    //4 floor
    reg ff0_share0,ff0_share1;
    reg ff1_share0,ff1_share1;
    reg ff2_share0,ff2_share1;
    reg ff3_share0,ff3_share1;

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
        state_cnt_60: next_state = state_cnt_61;
        state_cnt_61: next_state = state_cnt_62;
        state_cnt_62: next_state = state_cnt_63;
        state_cnt_63: next_state = state_cnt_64;
        state_cnt_64: next_state = state_cnt_65;        
        state_cnt_65: next_state =  state_cnt_2; 
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

  //////////////////////////////share0/////////////////////////////
    always @(posedge clk) begin
      if (!rst) begin
          s00_share0 <= 4'b0000;
          s01_share0 <= 4'b0000;
          s02_share0 <= 4'b0000;
          s03_share0 <= 4'b0000;
          s04_share0 <= 4'b0000;
          s05_share0 <= 4'b0000;
          s06_share0 <= 4'b0000;
          s07_share0 <= 4'b0000;
          s10_share0 <= 4'b0000;
          s11_share0 <= 4'b0000;
          s12_share0 <= 4'b0000;
          s13_share0 <= 4'b0000;
          s14_share0 <= 4'b0000;
          s15_share0 <= 4'b0000;
          s16_share0 <= 4'b0000;
          s17_share0 <= 4'b0000;
          s20_share0 <= 4'b0000;
          s21_share0 <= 4'b0000;
          s22_share0 <= 4'b0000;
          s23_share0 <= 4'b0000;
          s24_share0 <= 4'b0000;
          s25_share0 <= 4'b0000;
          s26_share0 <= 4'b0000;
          s27_share0 <= 4'b0000;
          s30_share0 <= 4'b0000;
          s31_share0 <= 4'b0000;
          s32_share0 <= 4'b0000;
          s33_share0 <= 4'b0000;
          s34_share0 <= 4'b0000;
          s35_share0 <= 4'b0000;
          s36_share0 <= 4'b0000;
          s37_share0 <= 4'b0000;
      end
      else begin 
      if (state == state_cnt_65) begin
          s07_share0 <= s02_share0;
          s06_share0 <= s01_share0;
          s05_share0 <= s06_share0;
          s04_share0 <= s05_share0;
          s03_share0 <= s14_share0;
          s02_share0 <= s13_share0;
          s01_share0 <= s10_share0;
          s00_share0 <= s17_share0;
          s17_share0 <= s04_share0;
          s16_share0 <= s03_share0;
          s15_share0 <= s00_share0;
          s14_share0 <= s07_share0;
          s13_share0 <= s16_share0;
          s12_share0 <= s15_share0;
          s11_share0 <= s12_share0;
          s10_share0 <= s11_share0;
          s27_share0 <= s21_share0;
          s26_share0 <= s20_share0;
          s25_share0 <= s37_share0;
          s24_share0 <= s36_share0;
          s23_share0 <= s33_share0;
          s22_share0 <= s32_share0;
          s21_share0 <= s25_share0;
          s20_share0 <= s24_share0;
          s37_share0 <= s23_share0;
          s36_share0 <= s22_share0;
          s35_share0 <= s31_share0;
          s34_share0 <= s30_share0;
          s33_share0 <= s35_share0;
          s32_share0 <= s34_share0;
          s31_share0 <= s27_share0;
          s30_share0 <= s26_share0;
      end
      else begin
          s00_share0 <= sin_ctr0 ? sbox_out0_share0 : s07_share0;
          s01_share0 <= s00_share0;
          s02_share0 <= s01_share0;
          s03_share0 <= s02_share0;
          s04_share0 <= s03_share0;
          s05_share0 <= s04_share0;
          s06_share0 <= s05_share0;
          s07_share0 <= s06_share0;
          s10_share0 <= sin_ctr1 ? sbox_out1_share0 : s17_share0;
          s11_share0 <= s10_share0;
          s12_share0 <= s11_share0;
          s13_share0 <= s12_share0;
          s14_share0 <= s13_share0;
          s15_share0 <= s14_share0;
          s16_share0 <= s15_share0;
          s17_share0 <= s16_share0;
          s20_share0 <= sin_ctr2 ? sbox_out2_share0 : s27_share0;
          s21_share0 <= s20_share0;
          s22_share0 <= s21_share0;
          s23_share0 <= s22_share0;
          s24_share0 <= s23_share0;
          s25_share0 <= s24_share0;
          s26_share0 <= s25_share0;
          s27_share0 <= s26_share0;
          s30_share0 <= sin_ctr3 ? sbox_out3_share0 : s37_share0;
          s31_share0 <= s30_share0;
          s32_share0 <= s31_share0;
          s33_share0 <= s32_share0;
          s34_share0 <= s33_share0;
          s35_share0 <= s34_share0;
          s36_share0 <= s35_share0;
          s37_share0 <= s36_share0;
      end
    end
  end

  //////////////////////////////share1/////////////////////////////
     always @(posedge clk) begin
      if (!rst) begin
          s00_share1 <= 4'b0000;
          s01_share1 <= 4'b0000;
          s02_share1 <= 4'b0000;
          s03_share1 <= 4'b0000;
          s04_share1 <= 4'b0000;
          s05_share1 <= 4'b0000;
          s06_share1 <= 4'b0000;
          s07_share1 <= 4'b0000;
          s10_share1 <= 4'b0000;
          s11_share1 <= 4'b0000;
          s12_share1 <= 4'b0000;
          s13_share1 <= 4'b0000;
          s14_share1 <= 4'b0000;
          s15_share1 <= 4'b0000;
          s16_share1 <= 4'b0000;
          s17_share1 <= 4'b0000;
          s20_share1 <= 4'b0000;
          s21_share1 <= 4'b0000;
          s22_share1 <= 4'b0000;
          s23_share1 <= 4'b0000;
          s24_share1 <= 4'b0000;
          s25_share1 <= 4'b0000;
          s26_share1 <= 4'b0000;
          s27_share1 <= 4'b0000;
          s30_share1 <= 4'b0000;
          s31_share1 <= 4'b0000;
          s32_share1 <= 4'b0000;
          s33_share1 <= 4'b0000;
          s34_share1 <= 4'b0000;
          s35_share1 <= 4'b0000;
          s36_share1 <= 4'b0000;
          s37_share1 <= 4'b0000;
      end
      else begin 
      if (state == state_cnt_65) begin
          s07_share1 <= s02_share1;
          s06_share1 <= s01_share1;
          s05_share1 <= s06_share1;
          s04_share1 <= s05_share1;
          s03_share1 <= s14_share1;
          s02_share1 <= s13_share1;
          s01_share1 <= s10_share1;
          s00_share1 <= s17_share1;
          s17_share1 <= s04_share1;
          s16_share1 <= s03_share1;
          s15_share1 <= s00_share1;
          s14_share1 <= s07_share1;
          s13_share1 <= s16_share1;
          s12_share1 <= s15_share1;
          s11_share1 <= s12_share1;
          s10_share1 <= s11_share1;
          s27_share1 <= s21_share1;
          s26_share1 <= s20_share1;
          s25_share1 <= s37_share1;
          s24_share1 <= s36_share1;
          s23_share1 <= s33_share1;
          s22_share1 <= s32_share1;
          s21_share1 <= s25_share1;
          s20_share1 <= s24_share1;
          s37_share1 <= s23_share1;
          s36_share1 <= s22_share1;
          s35_share1 <= s31_share1;
          s34_share1 <= s30_share1;
          s33_share1 <= s35_share1;
          s32_share1 <= s34_share1;
          s31_share1 <= s27_share1;
          s30_share1 <= s26_share1;
      end
      else begin
          s00_share1 <= sin_ctr0 ? sbox_out0_share1 : s07_share1;
          s01_share1 <= s00_share1;
          s02_share1 <= s01_share1;
          s03_share1 <= s02_share1;
          s04_share1 <= s03_share1;
          s05_share1 <= s04_share1;
          s06_share1 <= s05_share1;
          s07_share1 <= s06_share1;
          s10_share1 <= sin_ctr1 ? sbox_out1_share1 : s17_share1;
          s11_share1 <= s10_share1;
          s12_share1 <= s11_share1;
          s13_share1 <= s12_share1;
          s14_share1 <= s13_share1;
          s15_share1 <= s14_share1;
          s16_share1 <= s15_share1;
          s17_share1 <= s16_share1;
          s20_share1 <= sin_ctr2 ? sbox_out2_share1 : s27_share1;
          s21_share1 <= s20_share1;
          s22_share1 <= s21_share1;
          s23_share1 <= s22_share1;
          s24_share1 <= s23_share1;
          s25_share1 <= s24_share1;
          s26_share1 <= s25_share1;
          s27_share1 <= s26_share1;
          s30_share1 <= sin_ctr3 ? sbox_out3_share1 : s37_share1;
          s31_share1 <= s30_share1;
          s32_share1 <= s31_share1;
          s33_share1 <= s32_share1;
          s34_share1 <= s33_share1;
          s35_share1 <= s34_share1;
          s36_share1 <= s35_share1;
          s37_share1 <= s36_share1;
      end
    end
  end

assign done = last_round & round_num;

lfsr lsr (clk, rst, round_num, frist_round, last_round, rand_num);
//
assign data_out_share0 = ((kin_ctr0 == 1'b1) || (state == state_cnt_33) || (state == state_cnt_34))? sbox_in_share0 : s37_share0;
assign data_out_share1 = ((kin_ctr0 == 1'b1) || (state == state_cnt_33) || (state == state_cnt_34))? sbox_in_share1 : s37_share1;

/////////////////test data_out//////////////////
//wire [3:0] data_out;
//assign data_out = data_out_share0 ^ data_out_share1;
/////////////////////////////////////////////////////

assign frist_round_ctr = ((frist_round ^ round_num) || (frist_round ^  sin_frist_round_ctr)) && frist_round;     

always @(posedge clk) begin
    if(!rst)
        sin_frist_round_ctr <= 1'b0;
    else if (rand_num == 8'b00011011) 
        sin_frist_round_ctr <= 1'b1;
    else 
        sin_frist_round_ctr <= 1'b0; 
    end

  always @(posedge clk) begin
    if(!rst)
        begin
        rdata_share0 <= 4'b0000;
        rdata_share1 <= 4'b0000;
        end
    else 
        begin
        rdata_share0 <= data_in_share0;
        rdata_share1 <= data_in_share1;
        end
    end

always @(posedge clk) begin
    if(!rst) begin
        sbox_in_share0 <= 4'b0000;
        sbox_in_share1 <= 4'b0000;
        end
    else if (sbox_ctr0) 
        begin
        sbox_in_share0 <= (frist_round_ctr == 1'b1) ? rdata_share0 ^ rkey_share0 : s07_share0 ^ k37_share0;
        sbox_in_share1 <= (frist_round_ctr == 1'b1) ? rdata_share1 ^ rkey_share1 : s07_share1 ^ k37_share1;
        end
    else if (sbox_ctr1) 
        begin
        sbox_in_share0 <= (frist_round_ctr == 1'b1) ? rdata_share0 ^ rkey_share0 : s17_share0 ^ k37_share0;
        sbox_in_share1 <= (frist_round_ctr == 1'b1) ? rdata_share1 ^ rkey_share1 : s17_share1 ^ k37_share1;
        end
    else if (sbox_ctr2)  
        begin
        sbox_in_share0 <= (frist_round_ctr == 1'b1) ? rdata_share0 ^ rkey_share0 : s27_share0 ^ k37_share0;
        sbox_in_share1 <= (frist_round_ctr == 1'b1) ? rdata_share1 ^ rkey_share1 : s27_share1 ^ k37_share1;
        end
    else if (sbox_ctr3) 
        begin
        sbox_in_share0 <= (frist_round_ctr == 1'b1) ? rdata_share0 ^ rkey_share0 : s37_share0 ^ k37_share0;
        sbox_in_share1 <= (frist_round_ctr == 1'b1) ? rdata_share1 ^ rkey_share1 : s37_share1 ^ k37_share1;
        end
    else if (state == state_cnt_34) 
        begin
        sbox_in_share0 <= {rand_num[0],~rand_num[1],rand_num[2],rand_num[3]}  ^ k37_share0;
        sbox_in_share1 <= k37_share1;  
        end
    else if (state == state_cnt_35) 
        begin
        sbox_in_share0 <= {rand_num[4],rand_num[5],rand_num[6],rand_num[7]}  ^ k36_share0;
        sbox_in_share1 <= k36_share1;
        end
    else if (state == state_cnt_36) 
        begin
        sbox_in_share0 <= {rand_num[0],~rand_num[1],rand_num[2],~rand_num[3]} ^ k35_share0; 
        sbox_in_share1 <= k35_share1;
        end
    else if (state == state_cnt_37) 
        begin
        sbox_in_share0 <= {rand_num[4],~rand_num[5],rand_num[6],rand_num[7]}  ^ k34_share0;
        sbox_in_share1 <= k34_share1; 
        end
    else if (state == state_cnt_38) 
        begin
        sbox_in_share0 <= {rand_num[0],rand_num[1],rand_num[2],~rand_num[3]}  ^ k33_share0; 
        sbox_in_share1 <= k33_share1;
        end
    else if (state == state_cnt_39) 
        begin
        sbox_in_share0 <= {rand_num[4],rand_num[5],rand_num[6],~rand_num[7]}  ^ k32_share0;
        sbox_in_share1 <= k32_share1; 
        end
    else if (state == state_cnt_40) 
        begin
        sbox_in_share0 <= {rand_num[0],rand_num[1],rand_num[2],rand_num[3]}   ^ k31_share0;
        sbox_in_share1 <= k31_share1;  
        end
    else if (state == state_cnt_41) 
        begin
        sbox_in_share0 <= {rand_num[4],~rand_num[5],rand_num[6],~rand_num[7]} ^ k30_share0;
        sbox_in_share1 <= k30_share1;  
        end
    end
    
   //l floor
  always @(posedge clk) begin
     if (!rst) begin
        g1_share0 <= 1'b0;
        g1_share1 <= 1'b0;
        g2_share0 <= 1'b0;
        g2_share1 <= 1'b0;
        g0_0_share0 <= 1'b0;
        g0_1_share0 <= 1'b0;
        g0_0_share1 <= 1'b0;
        g0_1_share1 <= 1'b0;  
        g3_0_share0 <= 1'b0;
        g3_1_share0 <= 1'b0;
        g3_0_share1 <= 1'b0;
        g3_1_share1 <= 1'b0;             
     end
     //else if (kin_ctr0 == 1'b1 || state == state_cnt_33 || state == state_cnt_34 || state == state_cnt_35 || state == state_cnt_36 || kin_ctr1 == 1'b1) begin
     else if (kin_ctr0 == 1'b1 || state == state_cnt_33 || state == state_cnt_34 || state == state_cnt_35 || state == state_cnt_36 || state == state_cnt_37 ||state == state_cnt_38|| kin_ctr1 == 1'b1) begin
        g1_share0 <= sbox_in_share0[1];
        g1_share1 <= sbox_in_share1[1];
        
        g2_share0 <= sbox_in_share0[2];
        g2_share1 <= sbox_in_share1[2];

        g0_0_share0 <= (sbox_in_share0[3] & sbox_in_share0[2]) ^ sbox_in_share0[0] ^ 1;
        g0_1_share0 <= (sbox_in_share0[3] & sbox_in_share1[2]);
        g0_0_share1 <= (sbox_in_share1[3] & sbox_in_share0[2]);
        g0_1_share1 <= (sbox_in_share1[3] & sbox_in_share1[2]) ^ sbox_in_share1[0];

        g3_0_share0 <= (sbox_in_share0[2] & sbox_in_share0[1]) ^ sbox_in_share0[3] ^ sbox_in_share0[2] ^ sbox_in_share0[1];
        g3_1_share0 <= (sbox_in_share0[2] & sbox_in_share1[1]);
        g3_0_share1 <= (sbox_in_share1[2] & sbox_in_share0[1]);
        g3_1_share1 <= (sbox_in_share1[2] & sbox_in_share1[1]) ^ sbox_in_share1[3] ^ sbox_in_share1[2] ^ sbox_in_share1[1];
      end
   end

   //2 floor
    always @(posedge clk) begin
     if (!rst) begin
        gg0_share0 <= 1'b0;
        gg0_share1 <= 1'b0;
        gg1_share0 <= 1'b0;
        gg1_share1 <= 1'b0;
        gg2_share0 <= 1'b0;
        gg2_share1 <= 1'b0;
        gg3_share0 <= 1'b0;
        gg3_share1 <= 1'b0;
     end
     //else if (kin_ctr0 == 1'b1 || state == state_cnt_33 || state == state_cnt_34 || state == state_cnt_35 || state == state_cnt_36 || kin_ctr1 == 1'b1) begin
     else if (kin_ctr0 == 1'b1 || state == state_cnt_33 || state == state_cnt_34 || state == state_cnt_35 || state == state_cnt_36 || state == state_cnt_37 ||state == state_cnt_38|| kin_ctr1 == 1'b1) begin
        gg0_share0 <= (g0_0_share0 ^ g0_1_share0);
        gg0_share1 <= (g0_0_share1 ^ g0_1_share1);

        gg1_share0 <= g1_share0;
        gg1_share1 <= g1_share1;

        gg2_share0 <= g2_share0;
        gg2_share1 <= g2_share1;

        gg3_share0 <= (g3_0_share0 ^ g3_1_share0);
        gg3_share1 <= (g3_0_share1 ^ g3_1_share1);
      end
   end


   //3 floor
    always @(posedge clk) begin
     if (!rst) begin
        f0_share0 <= 1'b0;
        f0_share1 <= 1'b0;
        f1_0_share0 <= 1'b0;
        f1_1_share0 <= 1'b0;
        f1_0_share1 <= 1'b0;
        f1_1_share1 <= 1'b0;  
        f2_0_share0 <= 1'b0;
        f2_1_share0 <= 1'b0;
        f2_0_share1 <= 1'b0;
        f2_1_share1 <= 1'b0; 
        f3_share0 <= 1'b0;
        f3_share1 <= 1'b0;
     end
     else if (kin_ctr0 == 1'b1 || state == state_cnt_33 || state == state_cnt_34 || state == state_cnt_35 || state == state_cnt_36 || state == state_cnt_37 ||state == state_cnt_38|| kin_ctr1 == 1'b1) begin
        f0_share0 <= gg0_share0;
        f0_share1 <= gg0_share1;

        f1_0_share0 <= (gg0_share0 & gg3_share0) ^ gg0_share0 ^ gg3_share0 ^ gg1_share0;
        f1_1_share0 <= (gg0_share0 & gg3_share1);
        f1_0_share1 <= (gg0_share1 & gg3_share0);
        f1_1_share1 <= (gg0_share1 & gg3_share1) ^ gg0_share1 ^ gg3_share1 ^ gg1_share1;

        f2_0_share0 <= (gg1_share0 & gg0_share0) ^ gg2_share0 ^ 1;
        f2_1_share0 <= (gg1_share0 & gg0_share1);
        f2_0_share1 <= (gg1_share1 & gg0_share0);
        f2_1_share1 <= (gg1_share1 & gg0_share1) ^ gg2_share1;

        f3_share0 <= gg3_share0;
        f3_share1 <= gg3_share1;
      end
   end

   //2 floor
    always @(posedge clk) begin
     if (!rst) begin
        ff0_share0 <= 1'b0;
        ff0_share1 <= 1'b0;
        ff1_share0 <= 1'b0;
        ff1_share1 <= 1'b0;
        ff2_share0 <= 1'b0;
        ff2_share1 <= 1'b0;
        ff3_share0 <= 1'b0;
        ff3_share1 <= 1'b0;
     end
     else if (kin_ctr0 == 1'b1 || state == state_cnt_33 || state == state_cnt_34 || state == state_cnt_35 || state == state_cnt_36 || state == state_cnt_37 ||state == state_cnt_38|| kin_ctr1 == 1'b1) begin
        ff0_share0 <= f0_share0;
        ff0_share1 <= f0_share1;

        ff1_share0 <= (f1_0_share0 ^ f1_1_share0);
        ff1_share1 <= (f1_0_share1 ^ f1_1_share1);

        ff2_share0 <= (f2_0_share0 ^ f2_1_share0);
        ff2_share1 <= (f2_0_share1 ^ f2_1_share1);

        ff3_share0 <= f3_share0;
        ff3_share1 <= f3_share1;
      end
   end


   //add a compression floor
    assign  sbox_out_share0[0] = ff0_share0;
    assign  sbox_out_share1[0] = ff0_share1;
    assign  sbox_out_share0[1] = ff1_share0;
    assign  sbox_out_share1[1] = ff1_share1;
    assign  sbox_out_share0[2] = ff2_share0;
    assign  sbox_out_share1[2] = ff2_share1;
    assign  sbox_out_share0[3] = ff3_share0;
    assign  sbox_out_share1[3] = ff3_share1;

  always @(posedge clk) begin
      if (!rst) begin
          temp_4_value0_share0 <= 4'b0000;
          temp_4_value1_share0 <= 4'b0000;
          temp_4_value0_share1 <= 4'b0000;
          temp_4_value1_share1 <= 4'b0000;
      end
      else 
          begin
          temp_4_value0_share0 <= temp_4_in_share0;
          temp_4_value1_share0 <= temp_4_value0_share0;
          temp_4_value0_share1 <= temp_4_in_share1;
          temp_4_value1_share1 <= temp_4_value0_share1;
      end
  end
  
  always @(posedge clk) begin
      if (!rst) begin
          temp_8_value0_share0 <= 4'b0000;
          temp_8_value1_share0 <= 4'b0000;
          temp_8_value0_share1 <= 4'b0000;
          temp_8_value1_share1 <= 4'b0000;
      end
      else 
          begin
          temp_8_value0_share0 <= temp_8_in_share0;
          temp_8_value1_share0 <= temp_8_value0_share0;
          temp_8_value0_share1 <= temp_8_in_share1;
          temp_8_value1_share1 <= temp_8_value0_share1;
      end
  end

  always @(posedge clk) begin
      if (!rst) begin
          temp_12_value0_share0 <= 4'b0000;
          temp_12_value1_share0 <= 4'b0000;
          temp_12_value2_share0 <= 4'b0000;
          temp_12_value0_share1 <= 4'b0000;
          temp_12_value1_share1 <= 4'b0000;
          temp_12_value2_share1 <= 4'b0000;
      end
      else 
          begin
          temp_12_value0_share0 <= temp_12_in_share0;
          temp_12_value1_share0 <= temp_12_value0_share0;
          temp_12_value2_share0 <= temp_12_value1_share0;
          temp_12_value0_share1 <= temp_12_in_share1;
          temp_12_value1_share1 <= temp_12_value0_share1;
          temp_12_value2_share1 <= temp_12_value1_share1;
      end
  end

    always @(*) case(state)
          state_cnt_2,state_cnt_3,state_cnt_4,state_cnt_5,state_cnt_6,state_cnt_7,state_cnt_8,state_cnt_9:
              sbox_ctr0 = 1'b1;
          default :
              sbox_ctr0 = 1'b0;
    endcase

    always @(*) case(state)
          state_cnt_10,state_cnt_11,state_cnt_12,state_cnt_13,state_cnt_14,state_cnt_15,state_cnt_16,state_cnt_17:
              sbox_ctr1 = 1'b1;
          default :
              sbox_ctr1 = 1'b0;
    endcase

    always @(*) case(state)
          state_cnt_18,state_cnt_19,state_cnt_20,state_cnt_21,state_cnt_22,state_cnt_23,state_cnt_24,state_cnt_25:
              sbox_ctr2 = 1'b1;
          default :
              sbox_ctr2 = 1'b0;
    endcase

    always @(*) case(state)
          state_cnt_26,state_cnt_27,state_cnt_28,state_cnt_29,state_cnt_30,state_cnt_31,state_cnt_32,state_cnt_33:
              sbox_ctr3 = 1'b1;
          default :
              sbox_ctr3 = 1'b0;
    endcase

    always @(*) case(state)
          state_cnt_7,state_cnt_8,state_cnt_9,state_cnt_10,state_cnt_11,state_cnt_12,state_cnt_13,state_cnt_14,
          state_cnt_25,state_cnt_26,state_cnt_27,state_cnt_28,state_cnt_29,state_cnt_30,state_cnt_31,state_cnt_32,
          state_cnt_36,state_cnt_37,state_cnt_38,state_cnt_39,state_cnt_40,state_cnt_41,state_cnt_42,state_cnt_43,
          state_cnt_49,state_cnt_50,state_cnt_51,state_cnt_52,state_cnt_53,state_cnt_54,state_cnt_55,state_cnt_56:
              sin_ctr0 = 1'b1;
          default :
              sin_ctr0 = 1'b0;
    endcase
    
    always @(*) case(state)
          state_cnt_15,state_cnt_16,state_cnt_17,state_cnt_18,state_cnt_19,state_cnt_20,state_cnt_21,state_cnt_22,
          state_cnt_33,state_cnt_34,state_cnt_35,state_cnt_36,state_cnt_37,state_cnt_38,state_cnt_39,state_cnt_40,
          state_cnt_44,state_cnt_45,state_cnt_46,state_cnt_47,state_cnt_48,state_cnt_49,state_cnt_50,state_cnt_51,
          state_cnt_57,state_cnt_58,state_cnt_59,state_cnt_60,state_cnt_61,state_cnt_62,state_cnt_63,state_cnt_64:
              sin_ctr1 = 1'b1;
          default :
              sin_ctr1 = 1'b0;
    endcase
    
    always @(*) case(state)
          state_cnt_23,state_cnt_24,state_cnt_25,state_cnt_26,state_cnt_27,state_cnt_28,state_cnt_29,state_cnt_30,
          state_cnt_33,state_cnt_34,state_cnt_35,state_cnt_36,state_cnt_37,state_cnt_38,state_cnt_39,state_cnt_40,
          state_cnt_43,state_cnt_44,state_cnt_45,state_cnt_46,state_cnt_47,state_cnt_48,state_cnt_49,state_cnt_50:
              sin_ctr2 = 1'b1;
          default :
              sin_ctr2 = 1'b0;
    endcase
    
     always @(*) case(state) 
          state_cnt_31,state_cnt_32,state_cnt_33,state_cnt_34,state_cnt_35,state_cnt_36,state_cnt_37,state_cnt_38,
          state_cnt_41,state_cnt_42,state_cnt_43,state_cnt_44,state_cnt_45,state_cnt_46,state_cnt_47,state_cnt_48,
          state_cnt_51,state_cnt_52,state_cnt_53,state_cnt_54,state_cnt_55,state_cnt_56,state_cnt_57,state_cnt_58: 
              sin_ctr3 = 1'b1;
          default :
              sin_ctr3 = 1'b0;
    endcase
    
    always @(*) case(state)
          state_cnt_23,state_cnt_24,state_cnt_25,state_cnt_26,state_cnt_27,state_cnt_28,state_cnt_29,state_cnt_30:
              begin
              temp_4_in_share0 = s07_share0;
              temp_4_in_share1 = s07_share1;
              end
          state_cnt_31,state_cnt_32,state_cnt_33,state_cnt_34,state_cnt_35,state_cnt_36,state_cnt_37,state_cnt_38:
              begin
              temp_4_in_share0 = s17_share0;
              temp_4_in_share1 = s17_share1;
              end
          state_cnt_41,state_cnt_42,state_cnt_43,state_cnt_44,state_cnt_45,state_cnt_46,state_cnt_47,state_cnt_48:
              begin
              temp_4_in_share0 = s27_share0;
              temp_4_in_share1 = s27_share1;
              end
          state_cnt_49,state_cnt_50,state_cnt_51,state_cnt_52,state_cnt_53,state_cnt_54,state_cnt_55,state_cnt_56:
              begin
              temp_4_in_share0 = s37_share0;
              temp_4_in_share1 = s37_share1;
              end
          default :
              begin
              temp_4_in_share0 = 4'b0000;
              temp_4_in_share1 = 4'b0000;
              end
    endcase
    
    always @(*) case(state)
          state_cnt_31,state_cnt_32,state_cnt_33,state_cnt_34,state_cnt_35,state_cnt_36,state_cnt_37,state_cnt_38:
              begin
              temp_8_in_share0 = s27_share0;
              temp_8_in_share1 = s27_share1;
              end
          state_cnt_39,state_cnt_40,state_cnt_41,state_cnt_42,state_cnt_43,state_cnt_44,state_cnt_45,state_cnt_46:
              begin
              temp_8_in_share0 = s37_share0;
              temp_8_in_share1 = s37_share1;
              end
          default :
              begin
              temp_8_in_share0 = 4'b0000;
              temp_8_in_share1 = 4'b0000;
              end
    endcase

   always @(*) case(state)
          state_cnt_33,state_cnt_34,state_cnt_35,state_cnt_36,state_cnt_37,state_cnt_38,state_cnt_39,state_cnt_40:
              begin
              temp_12_in_share0 = s07_share0;
              temp_12_in_share1 = s07_share1;
              end
          state_cnt_41,state_cnt_42,state_cnt_43,state_cnt_44,state_cnt_45,state_cnt_46,state_cnt_47,state_cnt_48:
              begin
              temp_12_in_share0 = s17_share0;
              temp_12_in_share1 = s17_share1;
              end
          default :
              begin
              temp_12_in_share0 = 4'b0000;
              temp_12_in_share1 = 4'b0000;
              end
    endcase
     
    always @(*) case(state)
          state_cnt_7,state_cnt_8,state_cnt_9,state_cnt_10,state_cnt_11,state_cnt_12,state_cnt_13,state_cnt_14:
              begin
              sbox_out0_share0 = sbox_out_share0;
              sbox_out0_share1 = sbox_out_share1;
              end
          state_cnt_25,state_cnt_26,state_cnt_27,state_cnt_28,state_cnt_29,state_cnt_30,state_cnt_31,state_cnt_32:
              begin
              sbox_out0_share0 = temp_4_value1_share0 ^ s20_share0;
              sbox_out0_share1 = temp_4_value1_share1 ^ s20_share1;
              end
          state_cnt_36,state_cnt_37,state_cnt_38,state_cnt_39,state_cnt_40,state_cnt_41,state_cnt_42,state_cnt_43:
              begin
              sbox_out0_share0 = temp_12_value2_share0 ^ s20_share0;
              sbox_out0_share1 = temp_12_value2_share1 ^ s20_share1;
              end
          state_cnt_49,state_cnt_50,state_cnt_51,state_cnt_52,state_cnt_53,state_cnt_54,state_cnt_55,state_cnt_56:
              begin
              sbox_out0_share0 = s07_share0 ^ s20_share0;
              sbox_out0_share1 = s07_share1 ^ s20_share1;
              end
          default :
              begin
              sbox_out0_share0 = 4'b0000;
              sbox_out0_share1 = 4'b0000;
              end
    endcase
    
    always @(*) case(state)
          state_cnt_15,state_cnt_16,state_cnt_17,state_cnt_18,state_cnt_19,state_cnt_20,state_cnt_21,state_cnt_22:
              begin
              sbox_out1_share0 = sbox_out_share0;
              sbox_out1_share1 = sbox_out_share1;
              end
          state_cnt_33,state_cnt_34,state_cnt_35,state_cnt_36,state_cnt_37,state_cnt_38,state_cnt_39,state_cnt_40:
              begin
              sbox_out1_share0 = temp_4_value1_share0 ^ s30_share0;
              sbox_out1_share1 = temp_4_value1_share1 ^ s30_share1;
              end
          state_cnt_44,state_cnt_45,state_cnt_46,state_cnt_47,state_cnt_48,state_cnt_49,state_cnt_50,state_cnt_51:
              begin
              sbox_out1_share0 = temp_12_value2_share0 ^ s30_share0;
              sbox_out1_share1 = temp_12_value2_share1 ^ s30_share1;
              end
          state_cnt_57,state_cnt_58,state_cnt_59,state_cnt_60,state_cnt_61,state_cnt_62,state_cnt_63,state_cnt_64:
              begin
              sbox_out1_share0 = s17_share0 ^ s30_share0;
              sbox_out1_share1 = s17_share1 ^ s30_share1;
              end
          default :
              begin
              sbox_out1_share0 = 4'b0000;
              sbox_out1_share1 = 4'b0000;
              end
    endcase
  
    always @(*) case(state)
          state_cnt_23,state_cnt_24,state_cnt_25,state_cnt_26,state_cnt_27,state_cnt_28,state_cnt_29,state_cnt_30:
              begin
              sbox_out2_share0 = sbox_out_share0 ^ s07_share0;
              sbox_out2_share1 = sbox_out_share1 ^ s07_share1;
              end
          state_cnt_33,state_cnt_34,state_cnt_35,state_cnt_36,state_cnt_37,state_cnt_38,state_cnt_39,state_cnt_40:
              begin
              sbox_out2_share0 = s05_share0 ^ temp_8_value1_share0;
              sbox_out2_share1 = s05_share1 ^ temp_8_value1_share1;
              end
          state_cnt_43,state_cnt_44,state_cnt_45,state_cnt_46,state_cnt_47,state_cnt_48,state_cnt_49,state_cnt_50:
              begin
              sbox_out2_share0 = s01_share0 ^ temp_4_value1_share0;
              sbox_out2_share1 = s01_share1 ^ temp_4_value1_share1;
              end
          default :
              begin
              sbox_out2_share0 = 4'b0000;
              sbox_out2_share1 = 4'b0000;
              end
    endcase
    
    always @(*) case(state)
            state_cnt_31,state_cnt_32,state_cnt_33,state_cnt_34,state_cnt_35,state_cnt_36,state_cnt_37,state_cnt_38:
              begin
              sbox_out3_share0 = sbox_out_share0 ^ s17_share0;
              sbox_out3_share1 = sbox_out_share1 ^ s17_share1;
              end
            state_cnt_41,state_cnt_42,state_cnt_43,state_cnt_44,state_cnt_45,state_cnt_46,state_cnt_47,state_cnt_48:
              begin
              sbox_out3_share0 = s15_share0 ^ temp_8_value1_share0;
              sbox_out3_share1 = s15_share1 ^ temp_8_value1_share1;
              end
            state_cnt_51,state_cnt_52,state_cnt_53,state_cnt_54,state_cnt_55,state_cnt_56,state_cnt_57,state_cnt_58:
              begin
              sbox_out3_share0 = s11_share0 ^ temp_4_value1_share0;
              sbox_out3_share1 = s11_share1 ^ temp_4_value1_share1;
              end
          default :
              begin
              sbox_out3_share0 = 4'b0000;
              sbox_out3_share1 = 4'b0000;
              end
    endcase

   always @(posedge clk) begin
    if(!rst)
        begin
        rkey_share0 <= 4'b0000;
        rkey_share1 <= 4'b0000;
        end
    else 
        begin
        rkey_share0 <= key_in_share0;
        rkey_share1 <= key_in_share1;
        end
    end

  /////////////////////////////////keygen///////////////////
  /////////////////////////key_share0/////////////////////
    always @(posedge clk) begin
      if (!rst) begin
          k00_share0 <= 4'b0000;
          k01_share0 <= 4'b0000;
          k02_share0 <= 4'b0000;
          k03_share0 <= 4'b0000;
          k04_share0 <= 4'b0000;
          k05_share0 <= 4'b0000;
          k06_share0 <= 4'b0000;
          k07_share0 <= 4'b0000;
          k10_share0 <= 4'b0000;
          k11_share0 <= 4'b0000;
          k12_share0 <= 4'b0000;
          k13_share0 <= 4'b0000;
          k14_share0 <= 4'b0000;
          k15_share0 <= 4'b0000;
          k16_share0 <= 4'b0000;
          k17_share0 <= 4'b0000;
          k20_share0 <= 4'b0000;
          k21_share0 <= 4'b0000;
          k22_share0 <= 4'b0000;
          k23_share0 <= 4'b0000;
          k24_share0 <= 4'b0000;
          k25_share0 <= 4'b0000;
          k26_share0 <= 4'b0000;
          k27_share0 <= 4'b0000;
          k30_share0 <= 4'b0000;
          k31_share0 <= 4'b0000;
          k32_share0 <= 4'b0000;
          k33_share0 <= 4'b0000;
          k34_share0 <= 4'b0000;
          k35_share0 <= 4'b0000;
          k36_share0 <= 4'b0000;
          k37_share0 <= 4'b0000;
      end
      else if (kin_ctr0 == 1'b1) 
          begin
          k00_share0 <= (frist_round_ctr == 1'b1) ? rkey_share0 : k37_share0;   
          k01_share0 <= k00_share0;
          k02_share0 <= k01_share0;
          k03_share0 <= k02_share0;
          k04_share0 <= k03_share0;
          k05_share0 <= k04_share0;
          k06_share0 <= k05_share0;
          k07_share0 <= k06_share0;
          k10_share0 <= k07_share0;
          k11_share0 <= k10_share0;
          k12_share0 <= k11_share0;
          k13_share0 <= k12_share0;
          k14_share0 <= k13_share0;
          k15_share0 <= k14_share0;
          k16_share0 <= k15_share0;
          k17_share0 <= k16_share0;
          k20_share0 <= k17_share0;
          k21_share0 <= k20_share0;
          k22_share0 <= k21_share0;
          k23_share0 <= k22_share0;
          k24_share0 <= k23_share0;
          k25_share0 <= k24_share0;
          k26_share0 <= k25_share0;
          k27_share0 <= k26_share0;
          k30_share0 <= k27_share0;
          k31_share0 <= k30_share0;
          k32_share0 <= k31_share0;
          k33_share0 <= k32_share0;
          k34_share0 <= k33_share0;
          k35_share0 <= k34_share0;
          k36_share0 <= k35_share0;
          k37_share0 <= k36_share0;
      end
      else if (state == state_cnt_33) 
          begin
          k00_share0 <= (frist_round_ctr == 1'b1) ? rkey_share0 : k37_share0;
          k01_share0 <= k00_share0;
          k02_share0 <= k01_share0;
          k03_share0 <= k02_share0;
          k04_share0 <= k03_share0;
          k05_share0 <= k04_share0;
          k06_share0 <= k05_share0;
          k07_share0 <= k06_share0;
          k10_share0 <= k07_share0;
          k11_share0 <= k10_share0;
          k12_share0 <= k11_share0;
          k13_share0 <= k12_share0;
          k14_share0 <= k13_share0;
          k15_share0 <= k14_share0;
          k16_share0 <= k15_share0;
          k17_share0 <= k16_share0;
          k20_share0 <= k20_share0;
          k21_share0 <= k27_share0;
          k22_share0 <= k33_share0;
          k23_share0 <= k23_share0;
          k24_share0 <= k34_share0;
          k25_share0 <= k22_share0;
          k26_share0 <= k25_share0;
          k27_share0 <= k32_share0;
          k30_share0 <= k24_share0;
          k31_share0 <= k31_share0;
          k32_share0 <= k17_share0;
          k33_share0 <= k35_share0;
          k34_share0 <= k21_share0;
          k35_share0 <= k26_share0;
          k36_share0 <= k36_share0;
          k37_share0 <= k30_share0; 
          end
      else if (kin_ctr1 == 1'b1) 
          begin
          k10_share0 <= st_out_share0;
          k11_share0 <= k10_share0;
          k12_share0 <= k11_share0;
          k13_share0 <= k12_share0;
          k14_share0 <= k13_share0;
          k15_share0 <= k14_share0;
          k16_share0 <= k15_share0;
          k17_share0 <= k16_share0;   
          end
      else if (kin_ctr2 == 1'b1) 
          begin
          k20_share0 <= k27_share0;
          k21_share0 <= k20_share0;
          k22_share0 <= k21_share0;
          k23_share0 <= k22_share0;
          k24_share0 <= k23_share0;
          k25_share0 <= k24_share0;
          k26_share0 <= k25_share0;
          k27_share0 <= k26_share0;
          k00_share0 <= st_out_share0;
          k01_share0 <= k00_share0;
          k02_share0 <= k01_share0;
          k03_share0 <= k02_share0;
          k04_share0 <= k03_share0;
          k05_share0 <= k04_share0;
          k06_share0 <= k05_share0;
          k07_share0 <= k06_share0;   
          end
      else if (state == state_cnt_55)
          begin
          k00_share0 <= k30_share0;
          k01_share0 <= k31_share0;
          k02_share0 <= k32_share0;
          k03_share0 <= k33_share0;
          k04_share0 <= k34_share0;
          k05_share0 <= k35_share0;
          k06_share0 <= k36_share0;
          k07_share0 <= k37_share0; 
          k10_share0 <= k20_share0;
          k11_share0 <= k21_share0;
          k12_share0 <= k22_share0;
          k13_share0 <= k23_share0;
          k14_share0 <= k24_share0;
          k15_share0 <= k25_share0;
          k16_share0 <= k26_share0;
          k17_share0 <= k27_share0; 
          k20_share0 <= k00_share0;
          k21_share0 <= k01_share0;
          k22_share0 <= k02_share0;
          k23_share0 <= k03_share0;
          k24_share0 <= k04_share0;
          k25_share0 <= k05_share0;
          k26_share0 <= k06_share0;
          k27_share0 <= k07_share0; 
          k30_share0 <= k10_share0;
          k31_share0 <= k11_share0;
          k32_share0 <= k12_share0;
          k33_share0 <= k13_share0;
          k34_share0 <= k14_share0;
          k35_share0 <= k15_share0;
          k36_share0 <= k16_share0;
          k37_share0 <= k17_share0;   
          end
  end


//////////////////////////key_share1/////////////////////
    always @(posedge clk) begin
      if (!rst) begin
          k00_share1 <= 4'b0000;
          k01_share1 <= 4'b0000;
          k02_share1 <= 4'b0000;
          k03_share1 <= 4'b0000;
          k04_share1 <= 4'b0000;
          k05_share1 <= 4'b0000;
          k06_share1 <= 4'b0000;
          k07_share1 <= 4'b0000;
          k10_share1 <= 4'b0000;
          k11_share1 <= 4'b0000;
          k12_share1 <= 4'b0000;
          k13_share1 <= 4'b0000;
          k14_share1 <= 4'b0000;
          k15_share1 <= 4'b0000;
          k16_share1 <= 4'b0000;
          k17_share1 <= 4'b0000;
          k20_share1 <= 4'b0000;
          k21_share1 <= 4'b0000;
          k22_share1 <= 4'b0000;
          k23_share1 <= 4'b0000;
          k24_share1 <= 4'b0000;
          k25_share1 <= 4'b0000;
          k26_share1 <= 4'b0000;
          k27_share1 <= 4'b0000;
          k30_share1 <= 4'b0000;
          k31_share1 <= 4'b0000;
          k32_share1 <= 4'b0000;
          k33_share1 <= 4'b0000;
          k34_share1 <= 4'b0000;
          k35_share1 <= 4'b0000;
          k36_share1 <= 4'b0000;
          k37_share1 <= 4'b0000;
      end
      else if (kin_ctr0 == 1'b1) 
          begin
          k00_share1 <= (frist_round_ctr == 1'b1) ? rkey_share1 : k37_share1;
          k01_share1 <= k00_share1;
          k02_share1 <= k01_share1;
          k03_share1 <= k02_share1;
          k04_share1 <= k03_share1;
          k05_share1 <= k04_share1;
          k06_share1 <= k05_share1;
          k07_share1 <= k06_share1;
          k10_share1 <= k07_share1;
          k11_share1 <= k10_share1;
          k12_share1 <= k11_share1;
          k13_share1 <= k12_share1;
          k14_share1 <= k13_share1;
          k15_share1 <= k14_share1;
          k16_share1 <= k15_share1;
          k17_share1 <= k16_share1;
          k20_share1 <= k17_share1;
          k21_share1 <= k20_share1;
          k22_share1 <= k21_share1;
          k23_share1 <= k22_share1;
          k24_share1 <= k23_share1;
          k25_share1 <= k24_share1;
          k26_share1 <= k25_share1;
          k27_share1 <= k26_share1;
          k30_share1 <= k27_share1;
          k31_share1 <= k30_share1;
          k32_share1 <= k31_share1;
          k33_share1 <= k32_share1;
          k34_share1 <= k33_share1;
          k35_share1 <= k34_share1;
          k36_share1 <= k35_share1;
          k37_share1 <= k36_share1;
      end
      else if (state == state_cnt_33) 
          begin
          k00_share1 <= (frist_round_ctr == 1'b1) ? rkey_share1 : k37_share1;
          k01_share1 <= k00_share1;
          k02_share1 <= k01_share1;
          k03_share1 <= k02_share1;
          k04_share1 <= k03_share1;
          k05_share1 <= k04_share1;
          k06_share1 <= k05_share1;
          k07_share1 <= k06_share1;
          k10_share1 <= k07_share1;
          k11_share1 <= k10_share1;
          k12_share1 <= k11_share1;
          k13_share1 <= k12_share1;
          k14_share1 <= k13_share1;
          k15_share1 <= k14_share1;
          k16_share1 <= k15_share1;
          k17_share1 <= k16_share1;
          k20_share1 <= k20_share1;
          k21_share1 <= k27_share1;
          k22_share1 <= k33_share1;
          k23_share1 <= k23_share1;
          k24_share1 <= k34_share1;
          k25_share1 <= k22_share1;
          k26_share1 <= k25_share1;
          k27_share1 <= k32_share1;
          k30_share1 <= k24_share1;
          k31_share1 <= k31_share1;
          k32_share1 <= k17_share1;
          k33_share1 <= k35_share1;
          k34_share1 <= k21_share1;
          k35_share1 <= k26_share1;
          k36_share1 <= k36_share1;
          k37_share1 <= k30_share1; 
          end
      else if (kin_ctr1 == 1'b1) 
          begin
          k10_share1 <= st_out_share1;
          k11_share1 <= k10_share1;
          k12_share1 <= k11_share1;
          k13_share1 <= k12_share1;
          k14_share1 <= k13_share1;
          k15_share1 <= k14_share1;
          k16_share1 <= k15_share1;
          k17_share1 <= k16_share1;   
          end
      else if (kin_ctr2 == 1'b1) 
          begin
          k20_share1 <= k27_share1;
          k21_share1 <= k20_share1;
          k22_share1 <= k21_share1;
          k23_share1 <= k22_share1;
          k24_share1 <= k23_share1;
          k25_share1 <= k24_share1;
          k26_share1 <= k25_share1;
          k27_share1 <= k26_share1;
          k00_share1 <= st_out_share1;
          k01_share1 <= k00_share1;
          k02_share1 <= k01_share1;
          k03_share1 <= k02_share1;
          k04_share1 <= k03_share1;
          k05_share1 <= k04_share1;
          k06_share1 <= k05_share1;
          k07_share1 <= k06_share1;   
          end
      else if (state == state_cnt_55)
          begin
          k00_share1 <= k30_share1;
          k01_share1 <= k31_share1;
          k02_share1 <= k32_share1;
          k03_share1 <= k33_share1;
          k04_share1 <= k34_share1;
          k05_share1 <= k35_share1;
          k06_share1 <= k36_share1;
          k07_share1 <= k37_share1; 
          k10_share1 <= k20_share1;
          k11_share1 <= k21_share1;
          k12_share1 <= k22_share1;
          k13_share1 <= k23_share1;
          k14_share1 <= k24_share1;
          k15_share1 <= k25_share1;
          k16_share1 <= k26_share1;
          k17_share1 <= k27_share1; 
          k20_share1 <= k00_share1;
          k21_share1 <= k01_share1;
          k22_share1 <= k02_share1;
          k23_share1 <= k03_share1;
          k24_share1 <= k04_share1;
          k25_share1 <= k05_share1;
          k26_share1 <= k06_share1;
          k27_share1 <= k07_share1; 
          k30_share1 <= k10_share1;
          k31_share1 <= k11_share1;
          k32_share1 <= k12_share1;
          k33_share1 <= k13_share1;
          k34_share1 <= k14_share1;
          k35_share1 <= k15_share1;
          k36_share1 <= k16_share1;
          k37_share1 <= k17_share1;   
          end
  end

/////////////////test data_out//////////////////
//wire [3:0] key_out;
//assign key_out = k37_share0 ^ k37_share1;
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

    //zhe li shi tiao zheng S-box zhi, S-box shi yan chang 2 

    always @(*) case(state)
          //state_cnt_37,state_cnt_38,state_cnt_39,state_cnt_40,state_cnt_41,state_cnt_42,state_cnt_43,state_cnt_44:
          state_cnt_39,state_cnt_40,state_cnt_41,state_cnt_42,state_cnt_43,state_cnt_44,state_cnt_45,state_cnt_46:
              kin_ctr1 = 1'b1;
          default :
              kin_ctr1 = 1'b0;
    endcase

    always @(*) case(state)
          //state_cnt_45,state_cnt_46,state_cnt_47,state_cnt_48,state_cnt_49,state_cnt_50,state_cnt_51,state_cnt_52:
          state_cnt_47,state_cnt_48,state_cnt_49,state_cnt_50,state_cnt_51,state_cnt_52,state_cnt_53,state_cnt_54:
              kin_ctr2 = 1'b1;
          default :
              kin_ctr2 = 1'b0;
    endcase

    always @(*) case(state)
          //state_cnt_37,state_cnt_38,state_cnt_39,state_cnt_40,state_cnt_41,state_cnt_42,state_cnt_43,state_cnt_44:
          state_cnt_39,state_cnt_40,state_cnt_41,state_cnt_42,state_cnt_43,state_cnt_44,state_cnt_45,state_cnt_46:
              begin
              st_out_share0 = sbox_out_share0 ^ k17_share0;
              st_out_share1 = sbox_out_share1 ^ k17_share1;
              end
          //state_cnt_45,state_cnt_46,state_cnt_47,state_cnt_48,state_cnt_49,state_cnt_50,state_cnt_51,state_cnt_52:
          state_cnt_47,state_cnt_48,state_cnt_49,state_cnt_50,state_cnt_51,state_cnt_52,state_cnt_53,state_cnt_54:
              begin
              st_out_share0 = {k27_share0[2],k27_share0[1],k27_share0[0] ^ k27_share0[3],k27_share0[3]} ^ k07_share0;
              st_out_share1 = {k27_share1[2],k27_share1[1],k27_share1[0] ^ k27_share1[3],k27_share1[3]} ^ k07_share1;
              end
          default :
              begin
              st_out_share0 = 4'b0000;
              st_out_share1 = 4'b0000;
              end
    endcase


endmodule

