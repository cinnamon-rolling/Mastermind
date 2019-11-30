/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module game_FSM_8 (
    input clk,
    input rst,
    input enter,
    input toggle,
    input reset,
    output reg [5:0] alufn,
    output reg [2:0] asel,
    output reg [2:0] bsel,
    output reg [1:0] demux,
    output reg [7:0] led_out,
    output reg [7:0] led_out_1,
    output reg [7:0] led_out_2,
    output reg [7:0] led_out_3,
    output reg [7:0] led_out_4
  );
  
  
  
  localparam INIT_ANS_state = 6'd0;
  localparam INIT_state = 6'd1;
  localparam START_state = 6'd2;
  localparam IDLE_state = 6'd3;
  localparam STATE_RED_state = 6'd4;
  localparam STATE_GREEN_state = 6'd5;
  localparam STATE_BLUE_state = 6'd6;
  localparam CHECK_STATE_state = 6'd7;
  localparam CHECK_BULL_INIT_state = 6'd8;
  localparam CHECK_BULL_0_state = 6'd9;
  localparam CHECK_BULL_1_state = 6'd10;
  localparam CHECK_BULL_2_state = 6'd11;
  localparam CHECK_BULL_3_state = 6'd12;
  localparam CHECK_BULL_PART1_state = 6'd13;
  localparam CHECK_BULL_PART2_state = 6'd14;
  localparam CHECK_SUCCESS_state = 6'd15;
  localparam CHECK_COW_INIT_state = 6'd16;
  localparam CHECK_COW_0_0_state = 6'd17;
  localparam CHECK_COW_0_1_state = 6'd18;
  localparam CHECK_COW_0_2_state = 6'd19;
  localparam CHECK_COW_0_3_state = 6'd20;
  localparam CHECK_COW_1_0_state = 6'd21;
  localparam CHECK_COW_1_1_state = 6'd22;
  localparam CHECK_COW_1_2_state = 6'd23;
  localparam CHECK_COW_1_3_state = 6'd24;
  localparam CHECK_COW_2_0_state = 6'd25;
  localparam CHECK_COW_2_1_state = 6'd26;
  localparam CHECK_COW_2_2_state = 6'd27;
  localparam CHECK_COW_2_3_state = 6'd28;
  localparam CHECK_COW_3_0_state = 6'd29;
  localparam CHECK_COW_3_1_state = 6'd30;
  localparam CHECK_COW_3_2_state = 6'd31;
  localparam CHECK_COW_3_3_state = 6'd32;
  localparam CHECK_LIFE_PART1_state = 6'd33;
  localparam CHECK_LIFE_PART2_state = 6'd34;
  localparam CHECK_BULL_COW_CMPLE_state = 6'd35;
  localparam CHECK_BULL_COW_state = 6'd36;
  localparam SUCCESS_state = 6'd37;
  localparam FAIL_state = 6'd38;
  
  reg [5:0] M_state_d, M_state_q = INIT_ANS_state;
  reg [2:0] M_check_state_d, M_check_state_q = 1'h0;
  reg [2:0] M_check_row_d, M_check_row_q = 1'h0;
  reg [15:0] M_user_input_d, M_user_input_q = 1'h0;
  reg [15:0] M_temp_ans_bull_d, M_temp_ans_bull_q = 1'h0;
  reg [15:0] M_temp_input_bull_d, M_temp_input_bull_q = 1'h0;
  reg [2:0] M_bull_count_d, M_bull_count_q = 1'h0;
  reg [15:0] M_temp_ans_cow_d, M_temp_ans_cow_q = 1'h0;
  reg [15:0] M_temp_input_cow_d, M_temp_input_cow_q = 1'h0;
  reg [2:0] M_cow_count_d, M_cow_count_q = 1'h0;
  reg [3:0] M_check_ans_d, M_check_ans_q = 1'h0;
  reg [15:0] M_answer_d, M_answer_q = 1'h0;
  reg [7:0] M_final_d, M_final_q = 1'h0;
  reg [15:0] M_total_life_d, M_total_life_q = 1'h0;
  reg [2:0] M_check_bull_state_d, M_check_bull_state_q = 1'h0;
  wire [13-1:0] M_beta_guess_out;
  wire [13-1:0] M_beta_check_answer_out;
  wire [8-1:0] M_beta_led_1;
  wire [8-1:0] M_beta_led_2;
  wire [8-1:0] M_beta_led_3;
  wire [8-1:0] M_beta_led_4;
  wire [8-1:0] M_beta_led_5;
  wire [8-1:0] M_beta_led_6;
  wire [8-1:0] M_beta_led_7;
  wire [8-1:0] M_beta_led_8;
  wire [16-1:0] M_beta_fsmregisterlife;
  beta_12 beta (
    .clk(clk),
    .rst(rst),
    .guess_out(M_beta_guess_out),
    .check_answer_out(M_beta_check_answer_out),
    .led_1(M_beta_led_1),
    .led_2(M_beta_led_2),
    .led_3(M_beta_led_3),
    .led_4(M_beta_led_4),
    .led_5(M_beta_led_5),
    .led_6(M_beta_led_6),
    .led_7(M_beta_led_7),
    .led_8(M_beta_led_8),
    .fsmregisterlife(M_beta_fsmregisterlife)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_final_d = M_final_q;
    M_check_ans_d = M_check_ans_q;
    M_temp_input_bull_d = M_temp_input_bull_q;
    M_answer_d = M_answer_q;
    M_bull_count_d = M_bull_count_q;
    M_cow_count_d = M_cow_count_q;
    M_user_input_d = M_user_input_q;
    M_temp_ans_cow_d = M_temp_ans_cow_q;
    M_temp_ans_bull_d = M_temp_ans_bull_q;
    M_temp_input_cow_d = M_temp_input_cow_q;
    M_check_row_d = M_check_row_q;
    M_total_life_d = M_total_life_q;
    M_check_bull_state_d = M_check_bull_state_q;
    M_check_state_d = M_check_state_q;
    
    alufn = 1'h0;
    asel = 1'h0;
    bsel = 1'h0;
    demux = 1'h0;
    led_out = 1'h0;
    led_out_1 = M_bull_count_q;
    led_out_2 = M_cow_count_q;
    led_out_3 = M_check_row_q;
    led_out_4 = M_final_q;
    
    case (M_state_q)
      INIT_ANS_state: begin
        M_total_life_d = 3'h7;
        M_check_ans_d = 1'h0;
        M_state_d = INIT_state;
      end
      INIT_state: begin
        M_check_row_d = 1'h0;
        M_final_d = 1'h0;
        M_state_d = START_state;
      end
      START_state: begin
        if (reset) begin
          M_state_d = INIT_state;
        end
        if (M_check_ans_q == 1'h0) begin
          M_answer_d = 16'h9933;
        end else begin
          if (M_check_ans_q == 1'h1) begin
            M_answer_d = 16'h9535;
          end else begin
            if (M_check_ans_q == 2'h2) begin
              M_answer_d = 16'h9393;
            end else begin
              if (M_check_ans_q == 2'h3) begin
                M_answer_d = 16'h5359;
              end else begin
                if (M_check_ans_q == 3'h4) begin
                  M_answer_d = 16'h5955;
                end else begin
                  if (M_check_ans_q == 3'h5) begin
                    M_answer_d = 16'h9539;
                  end else begin
                    if (M_check_ans_q == 3'h6) begin
                      M_answer_d = 16'h9553;
                    end else begin
                      if (M_check_ans_q == 3'h7) begin
                        M_answer_d = 16'h3333;
                      end else begin
                        if (M_check_ans_q == 4'h8) begin
                          M_answer_d = 16'h3959;
                        end else begin
                          if (M_check_ans_q == 4'h9) begin
                            M_answer_d = 16'h3955;
                          end else begin
                            if (M_check_ans_q > 4'h9) begin
                              M_check_ans_d = 1'h0;
                              M_answer_d = 16'h9933;
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
        M_check_state_d = 1'h0;
        M_state_d = IDLE_state;
      end
      IDLE_state: begin
        if (toggle) begin
          M_state_d = STATE_RED_state;
        end
        if (reset) begin
          M_state_d = INIT_state;
        end
      end
      STATE_RED_state: begin
        led_out = 4'h9;
        if (toggle) begin
          M_state_d = STATE_GREEN_state;
        end else begin
          if (reset) begin
            M_state_d = INIT_state;
          end else begin
            if (enter) begin
              if (M_check_state_q == 1'h0) begin
                M_user_input_d[12+3-:4] = 4'h9;
              end else begin
                if (M_check_state_q == 1'h1) begin
                  M_user_input_d[8+3-:4] = 4'h9;
                end else begin
                  if (M_check_state_q == 2'h2) begin
                    M_user_input_d[4+3-:4] = 4'h9;
                  end else begin
                    if (M_check_state_q == 2'h3) begin
                      M_user_input_d[0+3-:4] = 4'h9;
                    end
                  end
                end
              end
              M_check_state_d = M_check_state_q + 1'h1;
              M_state_d = CHECK_STATE_state;
            end
          end
        end
      end
      STATE_GREEN_state: begin
        led_out = 4'h5;
        if (toggle) begin
          M_state_d = STATE_BLUE_state;
        end else begin
          if (reset) begin
            M_state_d = INIT_state;
          end else begin
            if (enter) begin
              if (M_check_state_q == 1'h0) begin
                M_user_input_d[12+3-:4] = 4'h5;
              end else begin
                if (M_check_state_q == 1'h1) begin
                  M_user_input_d[8+3-:4] = 4'h5;
                end else begin
                  if (M_check_state_q == 2'h2) begin
                    M_user_input_d[4+3-:4] = 4'h5;
                  end else begin
                    if (M_check_state_q == 2'h3) begin
                      M_user_input_d[0+3-:4] = 4'h5;
                    end
                  end
                end
              end
              M_check_state_d = M_check_state_q + 1'h1;
              M_state_d = CHECK_STATE_state;
            end
          end
        end
      end
      STATE_BLUE_state: begin
        led_out = 4'h3;
        if (toggle) begin
          M_state_d = STATE_RED_state;
        end else begin
          if (reset) begin
            M_state_d = INIT_state;
          end else begin
            if (enter) begin
              if (M_check_state_q == 1'h0) begin
                M_user_input_d[12+3-:4] = 4'h3;
              end else begin
                if (M_check_state_q == 1'h1) begin
                  M_user_input_d[8+3-:4] = 4'h3;
                end else begin
                  if (M_check_state_q == 2'h2) begin
                    M_user_input_d[4+3-:4] = 4'h3;
                  end else begin
                    if (M_check_state_q == 2'h3) begin
                      M_user_input_d[0+3-:4] = 4'h3;
                    end
                  end
                end
              end
              M_check_state_d = M_check_state_q + 1'h1;
              M_state_d = CHECK_STATE_state;
            end
          end
        end
      end
      CHECK_STATE_state: begin
        if (M_check_state_q == 3'h4) begin
          if (M_total_life_q == 3'h7) begin
            M_state_d = CHECK_LIFE_PART1_state;
          end else begin
            if (M_total_life_q < 3'h7) begin
              M_state_d = CHECK_LIFE_PART2_state;
            end
          end
        end else begin
          M_state_d = IDLE_state;
        end
      end
      CHECK_BULL_INIT_state: begin
        M_temp_ans_bull_d = M_answer_q;
        M_temp_input_bull_d = M_user_input_q;
        M_bull_count_d = 1'h0;
        M_state_d = CHECK_BULL_0_state;
      end
      CHECK_BULL_0_state: begin
        M_check_bull_state_d = 1'h0;
        if (M_temp_ans_bull_q[0+3-:4] == M_temp_input_bull_q[0+3-:4]) begin
          M_temp_input_cow_d[0+3-:4] = 4'h0;
          M_temp_ans_cow_d[0+3-:4] = 4'hf;
          if (M_bull_count_q == 1'h0) begin
            M_state_d = CHECK_BULL_PART1_state;
          end else begin
            if (M_bull_count_q > 1'h0) begin
              M_state_d = CHECK_BULL_PART2_state;
            end
          end
          M_bull_count_d = M_bull_count_q + 1'h1;
        end else begin
          M_temp_input_cow_d[0+3-:4] = M_temp_input_bull_q[0+3-:4];
          M_temp_ans_cow_d[0+3-:4] = M_answer_q[0+3-:4];
        end
        M_state_d = CHECK_BULL_1_state;
      end
      CHECK_BULL_1_state: begin
        M_check_bull_state_d = 1'h1;
        if (M_temp_ans_bull_q[4+3-:4] == M_temp_input_bull_q[4+3-:4]) begin
          M_temp_input_cow_d[4+3-:4] = 4'h0;
          M_temp_ans_cow_d[4+3-:4] = 4'hf;
          if (M_bull_count_q == 1'h0) begin
            M_state_d = CHECK_BULL_PART1_state;
          end else begin
            if (M_bull_count_q > 1'h0) begin
              M_state_d = CHECK_BULL_PART2_state;
            end
          end
          M_bull_count_d = M_bull_count_q + 1'h1;
        end else begin
          M_temp_input_cow_d[4+3-:4] = M_temp_input_bull_q[4+3-:4];
          M_temp_ans_cow_d[4+3-:4] = M_answer_q[4+3-:4];
        end
        M_state_d = CHECK_BULL_2_state;
      end
      CHECK_BULL_2_state: begin
        M_check_bull_state_d = 2'h2;
        if (M_temp_ans_bull_q[8+3-:4] == M_temp_input_bull_q[8+3-:4]) begin
          M_temp_input_cow_d[8+3-:4] = 4'h0;
          M_temp_ans_cow_d[8+3-:4] = 4'hf;
          if (M_bull_count_q == 1'h0) begin
            M_state_d = CHECK_BULL_PART1_state;
          end else begin
            if (M_bull_count_q > 1'h0) begin
              M_state_d = CHECK_BULL_PART2_state;
            end
          end
          M_bull_count_d = M_bull_count_q + 1'h1;
        end else begin
          M_temp_input_cow_d[8+3-:4] = M_temp_input_bull_q[8+3-:4];
          M_temp_ans_cow_d[8+3-:4] = M_answer_q[8+3-:4];
        end
        M_state_d = CHECK_BULL_3_state;
      end
      CHECK_BULL_3_state: begin
        M_check_bull_state_d = 2'h3;
        if (M_temp_ans_bull_q[12+3-:4] == M_temp_input_bull_q[12+3-:4]) begin
          M_temp_input_cow_d[12+3-:4] = 4'h0;
          M_temp_ans_cow_d[12+3-:4] = 4'hf;
          if (M_bull_count_q == 1'h0) begin
            M_state_d = CHECK_BULL_PART1_state;
          end else begin
            if (M_bull_count_q > 1'h0) begin
              M_state_d = CHECK_BULL_PART2_state;
            end
          end
          M_bull_count_d = M_bull_count_q + 1'h1;
        end else begin
          M_temp_input_cow_d[12+3-:4] = M_temp_input_bull_q[12+3-:4];
          M_temp_ans_cow_d[12+3-:4] = M_answer_q[12+3-:4];
        end
        M_state_d = CHECK_SUCCESS_state;
      end
      CHECK_BULL_PART1_state: begin
        asel = 3'h1;
        bsel = 3'h1;
        alufn = 6'h00;
        demux = 2'h2;
        if (M_check_bull_state_q == 1'h0) begin
          M_state_d = CHECK_BULL_1_state;
        end else begin
          if (M_check_bull_state_q == 1'h1) begin
            M_state_d = CHECK_BULL_2_state;
          end else begin
            if (M_check_bull_state_q == 2'h2) begin
              M_state_d = CHECK_BULL_3_state;
            end else begin
              if (M_check_bull_state_q == 2'h3) begin
                M_state_d = CHECK_SUCCESS_state;
              end
            end
          end
        end
      end
      CHECK_BULL_PART2_state: begin
        asel = 3'h3;
        bsel = 3'h1;
        alufn = 6'h00;
        demux = 2'h2;
        if (M_check_bull_state_q == 1'h0) begin
          M_state_d = CHECK_BULL_1_state;
        end else begin
          if (M_check_bull_state_q == 1'h1) begin
            M_state_d = CHECK_BULL_2_state;
          end else begin
            if (M_check_bull_state_q == 2'h2) begin
              M_state_d = CHECK_BULL_3_state;
            end else begin
              if (M_check_bull_state_q == 2'h3) begin
                M_state_d = CHECK_SUCCESS_state;
              end
            end
          end
        end
      end
      CHECK_SUCCESS_state: begin
        M_check_row_d = M_check_row_q + 1'h1;
        M_state_d = CHECK_BULL_COW_state;
      end
      CHECK_COW_INIT_state: begin
        M_cow_count_d = 1'h0;
        M_state_d = CHECK_COW_0_0_state;
      end
      CHECK_COW_0_0_state: begin
        if (M_temp_input_cow_q[0+3-:4] == M_temp_ans_cow_q[0+3-:4]) begin
          M_cow_count_d = M_cow_count_q + 1'h1;
          M_state_d = CHECK_COW_1_0_state;
        end else begin
          M_state_d = CHECK_COW_0_1_state;
        end
      end
      CHECK_COW_0_1_state: begin
        if (M_temp_input_cow_q[0+3-:4] == M_temp_ans_cow_q[4+3-:4]) begin
          M_cow_count_d = M_cow_count_q + 1'h1;
          M_state_d = CHECK_COW_1_0_state;
        end else begin
          M_state_d = CHECK_COW_0_2_state;
        end
      end
      CHECK_COW_0_2_state: begin
        if (M_temp_input_cow_q[0+3-:4] == M_temp_ans_cow_q[8+3-:4]) begin
          M_cow_count_d = M_cow_count_q + 1'h1;
          M_state_d = CHECK_COW_1_0_state;
        end else begin
          M_state_d = CHECK_COW_0_3_state;
        end
      end
      CHECK_COW_0_3_state: begin
        if (M_temp_input_cow_q[0+3-:4] == M_temp_ans_cow_q[12+3-:4]) begin
          M_cow_count_d = M_cow_count_q + 1'h1;
          M_state_d = CHECK_COW_1_0_state;
        end else begin
          M_state_d = CHECK_COW_1_0_state;
        end
      end
      CHECK_COW_1_0_state: begin
        if (M_temp_input_cow_q[4+3-:4] == M_temp_ans_cow_q[0+3-:4]) begin
          M_cow_count_d = M_cow_count_q + 1'h1;
          M_state_d = CHECK_COW_2_0_state;
        end else begin
          M_state_d = CHECK_COW_1_1_state;
        end
      end
      CHECK_COW_1_1_state: begin
        if (M_temp_input_cow_q[4+3-:4] == M_temp_ans_cow_q[4+3-:4]) begin
          M_cow_count_d = M_cow_count_q + 1'h1;
          M_state_d = CHECK_COW_2_0_state;
        end else begin
          M_state_d = CHECK_COW_1_2_state;
        end
      end
      CHECK_COW_1_2_state: begin
        if (M_temp_input_cow_q[4+3-:4] == M_temp_ans_cow_q[8+3-:4]) begin
          M_cow_count_d = M_cow_count_q + 1'h1;
          M_state_d = CHECK_COW_2_0_state;
        end else begin
          M_state_d = CHECK_COW_1_3_state;
        end
      end
      CHECK_COW_1_3_state: begin
        if (M_temp_input_cow_q[4+3-:4] == M_temp_ans_cow_q[12+3-:4]) begin
          M_cow_count_d = M_cow_count_q + 1'h1;
          M_state_d = CHECK_COW_2_0_state;
        end else begin
          M_state_d = CHECK_COW_2_0_state;
        end
      end
      CHECK_COW_2_0_state: begin
        if (M_temp_input_cow_q[8+3-:4] == M_temp_ans_cow_q[0+3-:4]) begin
          M_cow_count_d = M_cow_count_q + 1'h1;
          M_state_d = CHECK_COW_3_0_state;
        end else begin
          M_state_d = CHECK_COW_2_1_state;
        end
      end
      CHECK_COW_2_1_state: begin
        if (M_temp_input_cow_q[8+3-:4] == M_temp_ans_cow_q[4+3-:4]) begin
          M_cow_count_d = M_cow_count_q + 1'h1;
          M_state_d = CHECK_COW_3_0_state;
        end else begin
          M_state_d = CHECK_COW_2_2_state;
        end
      end
      CHECK_COW_2_2_state: begin
        if (M_temp_input_cow_q[8+3-:4] == M_temp_ans_cow_q[8+3-:4]) begin
          M_cow_count_d = M_cow_count_q + 1'h1;
          M_state_d = CHECK_COW_3_0_state;
        end else begin
          M_state_d = CHECK_COW_2_3_state;
        end
      end
      CHECK_COW_2_3_state: begin
        if (M_temp_input_cow_q[8+3-:4] == M_temp_ans_cow_q[12+3-:4]) begin
          M_cow_count_d = M_cow_count_q + 1'h1;
          M_state_d = CHECK_COW_3_0_state;
        end else begin
          M_state_d = CHECK_COW_3_0_state;
        end
      end
      CHECK_COW_3_0_state: begin
        if (M_temp_input_cow_q[12+3-:4] == M_temp_ans_cow_q[0+3-:4]) begin
          M_cow_count_d = M_cow_count_q + 1'h1;
          M_state_d = START_state;
        end else begin
          M_state_d = CHECK_COW_3_1_state;
        end
      end
      CHECK_COW_3_1_state: begin
        if (M_temp_input_cow_q[12+3-:4] == M_temp_ans_cow_q[4+3-:4]) begin
          M_cow_count_d = M_cow_count_q + 1'h1;
          M_state_d = START_state;
        end else begin
          M_state_d = CHECK_COW_3_2_state;
        end
      end
      CHECK_COW_3_2_state: begin
        if (M_temp_input_cow_q[12+3-:4] == M_temp_ans_cow_q[8+3-:4]) begin
          M_cow_count_d = M_cow_count_q + 1'h1;
          M_state_d = START_state;
        end else begin
          M_state_d = CHECK_COW_3_3_state;
        end
      end
      CHECK_COW_3_3_state: begin
        if (M_temp_input_cow_q[12+3-:4] == M_temp_ans_cow_q[12+3-:4]) begin
          M_cow_count_d = M_cow_count_q + 1'h1;
          M_state_d = START_state;
        end else begin
          M_state_d = START_state;
        end
      end
      CHECK_BULL_COW_state: begin
        if (M_bull_count_q == 3'h4) begin
          M_state_d = SUCCESS_state;
          M_cow_count_d = 1'h0;
        end else begin
          if (M_bull_count_q < 3'h4 & M_check_row_q == 3'h7) begin
            M_state_d = FAIL_state;
          end else begin
            if (M_bull_count_q < 3'h4 & M_check_row_q < 3'h7) begin
              M_state_d = CHECK_COW_INIT_state;
            end
          end
        end
      end
      CHECK_LIFE_PART1_state: begin
        asel = 3'h0;
        bsel = 3'h1;
        alufn = 6'h01;
        demux = 2'h1;
        M_total_life_d = M_beta_fsmregisterlife;
        M_state_d = CHECK_BULL_INIT_state;
      end
      CHECK_LIFE_PART2_state: begin
        asel = 3'h2;
        bsel = 3'h1;
        alufn = 6'h01;
        demux = 2'h1;
        M_total_life_d = M_beta_fsmregisterlife;
        M_state_d = CHECK_BULL_INIT_state;
      end
      SUCCESS_state: begin
        M_final_d = 8'hff;
        if (reset) begin
          M_check_ans_d = M_check_ans_q + 1'h1;
          M_state_d = INIT_state;
        end
      end
      FAIL_state: begin
        M_final_d = 8'haa;
        if (reset) begin
          M_check_ans_d = M_check_ans_q + 1'h1;
          M_state_d = INIT_state;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_check_state_q <= 1'h0;
      M_check_row_q <= 1'h0;
      M_user_input_q <= 1'h0;
      M_temp_ans_bull_q <= 1'h0;
      M_temp_input_bull_q <= 1'h0;
      M_bull_count_q <= 1'h0;
      M_temp_ans_cow_q <= 1'h0;
      M_temp_input_cow_q <= 1'h0;
      M_cow_count_q <= 1'h0;
      M_check_ans_q <= 1'h0;
      M_answer_q <= 1'h0;
      M_final_q <= 1'h0;
      M_total_life_q <= 1'h0;
      M_check_bull_state_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_check_state_q <= M_check_state_d;
      M_check_row_q <= M_check_row_d;
      M_user_input_q <= M_user_input_d;
      M_temp_ans_bull_q <= M_temp_ans_bull_d;
      M_temp_input_bull_q <= M_temp_input_bull_d;
      M_bull_count_q <= M_bull_count_d;
      M_temp_ans_cow_q <= M_temp_ans_cow_d;
      M_temp_input_cow_q <= M_temp_input_cow_d;
      M_cow_count_q <= M_cow_count_d;
      M_check_ans_q <= M_check_ans_d;
      M_answer_q <= M_answer_d;
      M_final_q <= M_final_d;
      M_total_life_q <= M_total_life_d;
      M_check_bull_state_q <= M_check_bull_state_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule
