`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/26 10:25:53
// Design Name: 
// Module Name: LFSR
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


(*keep = "true" , keep_hierarchy = "yes" *) module lfsr(clock, con_reset, round_num, frist_round, last_round, rand_num); //还需要控制信号round_signal
    input clock;
    input con_reset;
    input round_num;
    output frist_round;
    output last_round;
    output [7:0] rand_num;

    (* keep = "true" *) reg frist_round;
    (* keep = "true" *) reg last_round;
    (* keep = "true" *) reg [7:0] rand_num;


    always @(posedge clock)
        begin
            if (con_reset)
                rand_num    <= 8'b00110110;
            else if(round_num == 1'b1)
            begin
                rand_num[7] <= rand_num[0] ^ rand_num[1] ^ rand_num[5] ^ rand_num[6];
                rand_num[6] <= rand_num[7];
                rand_num[5] <= rand_num[6];
                rand_num[4] <= rand_num[5];
                rand_num[3] <= rand_num[4];
                rand_num[2] <= rand_num[3];
                rand_num[1] <= rand_num[2];
                rand_num[0] <= rand_num[1];
            end
        end
    
    always @(*) begin
      if (rand_num == 8'b00110110 ||  rand_num == 8'b00011011) 
          frist_round = 1'b1;
      else 
          frist_round = 1'b0;
      end

    always @(*) begin
      //if (rand_num == 8'b01000011)    // 16 round(RC is 82, 10000010-01000001-01000011) 
      if (rand_num == 8'b11000011)  // 3 round(RC is 83,  10000011-11000011) 
      //if (rand_num == 8'b01000011)  // 4 round(RC is C7,  11000111-11100001) 
          last_round = 1'b1;
      else 
          last_round = 1'b0;
      end
endmodule




