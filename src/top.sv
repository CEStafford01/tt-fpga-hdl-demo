//_\TLV_version 1d: tl-x.org, generated by SandPiper(TM) 1.14-2022/10/10-beta-Pro
//_\source top.tlv 41

//_\SV
   // Include Tiny Tapeout Lab.
   // Included URL: "https://raw.githubusercontent.com/os-fpga/Virtual-FPGA-Lab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlv_lib/tiny_tapeout_lib.tlv"// Included URL: "https://raw.githubusercontent.com/os-fpga/Virtual-FPGA-Lab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlv_lib/fpga_includes.tlv"
//_\source top.tlv 231

//_\SV

// ================================================
// A simple Makerchip Verilog test bench driving random stimulus.
// Modify the module contents to your needs.
// ================================================

module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
   // Tiny tapeout I/O signals.
   logic [7:0] ui_in, uo_out;
   logic [7:0]uio_in,  uio_out, uio_oe;
   logic [31:0] r;  // a random value
   always @(posedge clk) r <= 0;
   assign ui_in = r[7:0];
   assign uio_in = 8'b0;
   logic ena = 1'b0;
   logic rst_n = ! reset;

   /*
   // Or, to provide specific inputs at specific times (as for lab C-TB) ...
   // BE SURE TO COMMENT THE ASSIGNMENT OF INPUTS ABOVE.
   // BE SURE TO DRIVE THESE ON THE B-PHASE OF THE CLOCK (ODD STEPS).
   // Driving on the rising clock edge creates a race with the clock that has unpredictable simulation behavior.
   initial begin
      #1  // Drive inputs on the B-phase.
         ui_in = 8'h0;
      #10 // Step 5 cycles, past reset.
         ui_in = 8'hFF;
      // ...etc.
   end
   */

   // Instantiate the Tiny Tapeout module.
   tt_um_template tt(.*);

   assign passed = top.cyc_cnt > 60;
   assign failed = 1'b0;
endmodule


// Provide a wrapper module to debounce input signals if requested.

//_\SV



// =======================
// The Tiny Tapeout module
// =======================

module tt_um_template (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
       // The FPGA is based on TinyTapeout 3 which has no bidirectional I/Os (vs. TT6 for the ASIC).
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
   wire reset = ! rst_n;

// ---------- Generated Code Inlined Here (before 1st \TLV) ----------
// Generated by SandPiper(TM) 1.14-2022/10/10-beta-Pro from Redwood EDA, LLC.
// (Installed here: /usr/local/mono/sandpiper/distro.)
// Redwood EDA, LLC does not claim intellectual property rights to this file and provides no warranty regarding its correctness or quality.


// For silencing unused signal messages.
`define BOGUS_USE(ignore)


genvar digit, input_label, leds, switch;


//
// Signals declared top-level.
//

// For $slideswitch.
logic [7:0] L0_slideswitch_a0;

// For $sseg_decimal_point_n.
logic L0_sseg_decimal_point_n_a0;

// For $sseg_digit_n.
logic [7:0] L0_sseg_digit_n_a0;

// For $sseg_segment_n.
logic [6:0] L0_sseg_segment_n_a0;

// For /fpga_pins/fpga|traffic$a_light.
logic [1:0] FpgaPins_Fpga_TRAFFIC_a_light_a1,
            FpgaPins_Fpga_TRAFFIC_a_light_a2;

// For /fpga_pins/fpga|traffic$a_lt_light.
logic [1:0] FpgaPins_Fpga_TRAFFIC_a_lt_light_a1,
            FpgaPins_Fpga_TRAFFIC_a_lt_light_a2;

// For /fpga_pins/fpga|traffic$ab.
logic FpgaPins_Fpga_TRAFFIC_ab_a1,
      FpgaPins_Fpga_TRAFFIC_ab_a2;

// For /fpga_pins/fpga|traffic$all_red.
logic FpgaPins_Fpga_TRAFFIC_all_red_a1,
      FpgaPins_Fpga_TRAFFIC_all_red_a2;

// For /fpga_pins/fpga|traffic$b_light.
logic [1:0] FpgaPins_Fpga_TRAFFIC_b_light_a1,
            FpgaPins_Fpga_TRAFFIC_b_light_a2;

// For /fpga_pins/fpga|traffic$b_lt_light.
logic [1:0] FpgaPins_Fpga_TRAFFIC_b_lt_light_a1,
            FpgaPins_Fpga_TRAFFIC_b_lt_light_a2;

// For /fpga_pins/fpga|traffic$b_or_a.
logic FpgaPins_Fpga_TRAFFIC_b_or_a_a1,
      FpgaPins_Fpga_TRAFFIC_b_or_a_a2;

// For /fpga_pins/fpga|traffic$ba.
logic FpgaPins_Fpga_TRAFFIC_ba_a1,
      FpgaPins_Fpga_TRAFFIC_ba_a2;

// For /fpga_pins/fpga|traffic$cycle.
logic FpgaPins_Fpga_TRAFFIC_cycle_a0,
      FpgaPins_Fpga_TRAFFIC_cycle_a1;

// For /fpga_pins/fpga|traffic$output_counter.
logic [7:0] FpgaPins_Fpga_TRAFFIC_output_counter_a0,
            FpgaPins_Fpga_TRAFFIC_output_counter_a1;

// For /fpga_pins/fpga|traffic$reset.
logic FpgaPins_Fpga_TRAFFIC_reset_a0,
      FpgaPins_Fpga_TRAFFIC_reset_a1,
      FpgaPins_Fpga_TRAFFIC_reset_a2;

// For /fpga_pins/fpga|traffic$second_counter.
logic [31:0] FpgaPins_Fpga_TRAFFIC_second_counter_a0,
             FpgaPins_Fpga_TRAFFIC_second_counter_a1;

// For /fpga_pins/fpga|traffic$sel.
logic FpgaPins_Fpga_TRAFFIC_sel_a0,
      FpgaPins_Fpga_TRAFFIC_sel_a1,
      FpgaPins_Fpga_TRAFFIC_sel_a2;

// For /fpga_pins/fpga|traffic$turn.
logic [1:0] FpgaPins_Fpga_TRAFFIC_turn_a1,
            FpgaPins_Fpga_TRAFFIC_turn_a2;

// For /fpga_pins/fpga|traffic/light$light.
logic [1:0] FpgaPins_Fpga_TRAFFIC_Light_light_a1,
            FpgaPins_Fpga_TRAFFIC_Light_light_a2;

// For /fpga_pins/fpga|traffic/light$rs.
logic FpgaPins_Fpga_TRAFFIC_Light_rs_a1;

// For /fpga_pins/fpga|traffic/light_lt$light.
logic [1:0] FpgaPins_Fpga_TRAFFIC_LightLt_light_a1,
            FpgaPins_Fpga_TRAFFIC_LightLt_light_a2;

// For /fpga_pins/fpga|traffic/light_lt$rs.
logic FpgaPins_Fpga_TRAFFIC_LightLt_rs_a1;




   //
   // Scope: /fpga_pins
   //


      //
      // Scope: /fpga
      //


         //
         // Scope: |traffic
         //

            // Staging of $a_light.
            always_ff @(posedge clk) FpgaPins_Fpga_TRAFFIC_a_light_a2[1:0] <= FpgaPins_Fpga_TRAFFIC_a_light_a1[1:0];

            // Staging of $a_lt_light.
            always_ff @(posedge clk) FpgaPins_Fpga_TRAFFIC_a_lt_light_a2[1:0] <= FpgaPins_Fpga_TRAFFIC_a_lt_light_a1[1:0];

            // Staging of $ab.
            always_ff @(posedge clk) FpgaPins_Fpga_TRAFFIC_ab_a2 <= FpgaPins_Fpga_TRAFFIC_ab_a1;

            // Staging of $all_red.
            always_ff @(posedge clk) FpgaPins_Fpga_TRAFFIC_all_red_a2 <= FpgaPins_Fpga_TRAFFIC_all_red_a1;

            // Staging of $b_light.
            always_ff @(posedge clk) FpgaPins_Fpga_TRAFFIC_b_light_a2[1:0] <= FpgaPins_Fpga_TRAFFIC_b_light_a1[1:0];

            // Staging of $b_lt_light.
            always_ff @(posedge clk) FpgaPins_Fpga_TRAFFIC_b_lt_light_a2[1:0] <= FpgaPins_Fpga_TRAFFIC_b_lt_light_a1[1:0];

            // Staging of $b_or_a.
            always_ff @(posedge clk) FpgaPins_Fpga_TRAFFIC_b_or_a_a2 <= FpgaPins_Fpga_TRAFFIC_b_or_a_a1;

            // Staging of $ba.
            always_ff @(posedge clk) FpgaPins_Fpga_TRAFFIC_ba_a2 <= FpgaPins_Fpga_TRAFFIC_ba_a1;

            // Staging of $cycle.
            always_ff @(posedge clk) FpgaPins_Fpga_TRAFFIC_cycle_a1 <= FpgaPins_Fpga_TRAFFIC_cycle_a0;

            // Staging of $output_counter.
            always_ff @(posedge clk) FpgaPins_Fpga_TRAFFIC_output_counter_a1[7:0] <= FpgaPins_Fpga_TRAFFIC_output_counter_a0[7:0];

            // Staging of $reset.
            always_ff @(posedge clk) FpgaPins_Fpga_TRAFFIC_reset_a1 <= FpgaPins_Fpga_TRAFFIC_reset_a0;
            always_ff @(posedge clk) FpgaPins_Fpga_TRAFFIC_reset_a2 <= FpgaPins_Fpga_TRAFFIC_reset_a1;

            // Staging of $second_counter.
            always_ff @(posedge clk) FpgaPins_Fpga_TRAFFIC_second_counter_a1[31:0] <= FpgaPins_Fpga_TRAFFIC_second_counter_a0[31:0];

            // Staging of $sel.
            always_ff @(posedge clk) FpgaPins_Fpga_TRAFFIC_sel_a1 <= FpgaPins_Fpga_TRAFFIC_sel_a0;
            always_ff @(posedge clk) FpgaPins_Fpga_TRAFFIC_sel_a2 <= FpgaPins_Fpga_TRAFFIC_sel_a1;

            // Staging of $turn.
            always_ff @(posedge clk) FpgaPins_Fpga_TRAFFIC_turn_a2[1:0] <= FpgaPins_Fpga_TRAFFIC_turn_a1[1:0];


            //
            // Scope: /light
            //

               // Staging of $light.
               always_ff @(posedge clk) FpgaPins_Fpga_TRAFFIC_Light_light_a2[1:0] <= FpgaPins_Fpga_TRAFFIC_Light_light_a1[1:0];



            //
            // Scope: /light_lt
            //

               // Staging of $light.
               always_ff @(posedge clk) FpgaPins_Fpga_TRAFFIC_LightLt_light_a2[1:0] <= FpgaPins_Fpga_TRAFFIC_LightLt_light_a1[1:0];









//
// Debug Signals
//

   if (1) begin : DEBUG_SIGS_GTKWAVE

      (* keep *) logic [7:0] \@0$slideswitch ;
      assign \@0$slideswitch = L0_slideswitch_a0;
      (* keep *) logic  \@0$sseg_decimal_point_n ;
      assign \@0$sseg_decimal_point_n = L0_sseg_decimal_point_n_a0;
      (* keep *) logic [7:0] \@0$sseg_digit_n ;
      assign \@0$sseg_digit_n = L0_sseg_digit_n_a0;
      (* keep *) logic [6:0] \@0$sseg_segment_n ;
      assign \@0$sseg_segment_n = L0_sseg_segment_n_a0;

      //
      // Scope: /digit[0:0]
      //
      for (digit = 0; digit <= 0; digit++) begin : \/digit 

         //
         // Scope: /leds[7:0]
         //
         for (leds = 0; leds <= 7; leds++) begin : \/leds 
            (* keep *) logic  \//@0$viz_lit ;
            assign \//@0$viz_lit = L1_Digit[digit].L2_Leds[leds].L2_viz_lit_a0;
         end
      end

      //
      // Scope: /fpga_pins
      //
      if (1) begin : \/fpga_pins 

         //
         // Scope: /fpga
         //
         if (1) begin : \/fpga 

            //
            // Scope: |traffic
            //
            if (1) begin : P_traffic
               (* keep *) logic [1:0] \///?$cycle?$ab@1$a_light ;
               assign \///?$cycle?$ab@1$a_light = FpgaPins_Fpga_TRAFFIC_a_light_a1;
               (* keep *) logic [1:0] \///?$cycle?$ab@1$a_lt_light ;
               assign \///?$cycle?$ab@1$a_lt_light = FpgaPins_Fpga_TRAFFIC_a_lt_light_a1;
               (* keep *) logic  \///@1$ab ;
               assign \///@1$ab = FpgaPins_Fpga_TRAFFIC_ab_a1;
               (* keep *) logic  \///?$cycle@1$all_red ;
               assign \///?$cycle@1$all_red = FpgaPins_Fpga_TRAFFIC_all_red_a1;
               (* keep *) logic [1:0] \///?$cycle?$ba@1$b_light ;
               assign \///?$cycle?$ba@1$b_light = FpgaPins_Fpga_TRAFFIC_b_light_a1;
               (* keep *) logic [1:0] \///?$cycle?$ba@1$b_lt_light ;
               assign \///?$cycle?$ba@1$b_lt_light = FpgaPins_Fpga_TRAFFIC_b_lt_light_a1;
               (* keep *) logic  \///?$cycle@1$b_or_a ;
               assign \///?$cycle@1$b_or_a = FpgaPins_Fpga_TRAFFIC_b_or_a_a1;
               (* keep *) logic  \///@1$ba ;
               assign \///@1$ba = FpgaPins_Fpga_TRAFFIC_ba_a1;
               (* keep *) logic  \///@0$cycle ;
               assign \///@0$cycle = FpgaPins_Fpga_TRAFFIC_cycle_a0;
               (* keep *) logic [7:0] \///@0$output_counter ;
               assign \///@0$output_counter = FpgaPins_Fpga_TRAFFIC_output_counter_a0;
               (* keep *) logic  \///@0$reset ;
               assign \///@0$reset = FpgaPins_Fpga_TRAFFIC_reset_a0;
               (* keep *) logic [31:0] \///@0$second_counter ;
               assign \///@0$second_counter = FpgaPins_Fpga_TRAFFIC_second_counter_a0;
               (* keep *) logic  \///@0$sel ;
               assign \///@0$sel = FpgaPins_Fpga_TRAFFIC_sel_a0;
               (* keep *) logic [1:0] \///?$cycle@1$turn ;
               assign \///?$cycle@1$turn = FpgaPins_Fpga_TRAFFIC_turn_a1;

               //
               // Scope: /light
               //
               if (1) begin : \/light 
                  (* keep *) logic [1:0] \///?$cycle/@1$light ;
                  assign \///?$cycle/@1$light = FpgaPins_Fpga_TRAFFIC_Light_light_a1;
                  (* keep *) logic  \///?$cycle/@1$rs ;
                  assign \///?$cycle/@1$rs = FpgaPins_Fpga_TRAFFIC_Light_rs_a1;
               end

               //
               // Scope: /light_lt
               //
               if (1) begin : \/light_lt 
                  (* keep *) logic [1:0] \///?$cycle/@1$light ;
                  assign \///?$cycle/@1$light = FpgaPins_Fpga_TRAFFIC_LightLt_light_a1;
                  (* keep *) logic  \///?$cycle/@1$rs ;
                  assign \///?$cycle/@1$rs = FpgaPins_Fpga_TRAFFIC_LightLt_rs_a1;
               end
            end
         end
      end

      //
      // Scope: /switch[7:0]
      //
      for (switch = 0; switch <= 7; switch++) begin : \/switch 
         (* keep *) logic  \/@0$viz_switch ;
         assign \/@0$viz_switch = L1_Switch[switch].L1_viz_switch_a0;
      end


   end

// ---------- Generated Code Ends ----------
//_\TLV
   /* verilator lint_off UNOPTFLAT */
   // Connect Tiny Tapeout I/Os to Virtual FPGA Lab.
   //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlvlib/tinytapeoutlib.tlv 76   // Instantiated from top.tlv, 300 as: m5+tt_connections()
      assign L0_slideswitch_a0[7:0] = ui_in;
      assign L0_sseg_segment_n_a0[6:0] = ~ uo_out[6:0];
      assign L0_sseg_decimal_point_n_a0 = ~ uo_out[7];
      assign L0_sseg_digit_n_a0[7:0] = 8'b11111110;
   //_\end_source

   // Instantiate the Virtual FPGA Lab.
   //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 307   // Instantiated from top.tlv, 303 as: m5+board(/top, /fpga, 7, $, , traffic)
      
      //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 355   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 309 as: m4+thanks(m5__l(309)m5_eval(m5_get(BOARD_THANKS_ARGS)))
         //_/thanks
            
      //_\end_source
      
   
      // Board VIZ.
   
      // Board Image.
      
      //_/fpga_pins
         
         //_/fpga
            //_\source top.tlv 48   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 340 as: m4+traffic.
            
            
               //_|traffic
                  //cycle through Red Green cycles
            
            
                  //Clock to seconds counter
                  //_@0
                     /*$car = *ui_in[0];
                     $need_to_clear = ($car)
                                      ? 1'b1:
                                      >>1$clear & !$car
                                      ? 1'b0:
                                      >>1$need_to_clear;
                     $clear =  (>>2$ab & (>>2$a_light == 2'b00));
                     */
                     assign FpgaPins_Fpga_TRAFFIC_reset_a0 = reset;
                     /* $second_counter[31:0] = $reset ?
                                          32'b0:
                                        $need_to_clear
                                         ? >>1$second_counter +1:
                                         >>1$second_counter;
                     */
                     assign FpgaPins_Fpga_TRAFFIC_second_counter_a0[31:0] = FpgaPins_Fpga_TRAFFIC_reset_a0 ?
                                          32'b0:
                                        FpgaPins_Fpga_TRAFFIC_second_counter_a1 +1;
                     assign FpgaPins_Fpga_TRAFFIC_output_counter_a0[7:0] = FpgaPins_Fpga_TRAFFIC_reset_a0 ?
                                          8'b0:
                                          FpgaPins_Fpga_TRAFFIC_output_counter_a1 +1;
                     assign FpgaPins_Fpga_TRAFFIC_cycle_a0 = (FpgaPins_Fpga_TRAFFIC_second_counter_a0[24] & !FpgaPins_Fpga_TRAFFIC_second_counter_a1[24]);
                     //$cycle = (*ui_in[0]);
                     assign FpgaPins_Fpga_TRAFFIC_sel_a0 = !FpgaPins_Fpga_TRAFFIC_output_counter_a0[4];
                  //_@1
                     assign FpgaPins_Fpga_TRAFFIC_ba_a1 = FpgaPins_Fpga_TRAFFIC_b_or_a_a1;
                     assign FpgaPins_Fpga_TRAFFIC_ab_a1 = !FpgaPins_Fpga_TRAFFIC_b_or_a_a1;
                     //$update = $cycle & !>>1$cycle;
                  //_?$cycle
                     //_@1
                        //turn logic
                        assign FpgaPins_Fpga_TRAFFIC_b_or_a_a1 = FpgaPins_Fpga_TRAFFIC_reset_a1
                                ? 1'b1:
                                !FpgaPins_Fpga_TRAFFIC_cycle_a1
                                ? FpgaPins_Fpga_TRAFFIC_b_or_a_a2:
                                (FpgaPins_Fpga_TRAFFIC_all_red_a1 & !FpgaPins_Fpga_TRAFFIC_all_red_a2)
                                ? !FpgaPins_Fpga_TRAFFIC_b_or_a_a2:
                                FpgaPins_Fpga_TRAFFIC_b_or_a_a2;
            
                        //Logic Control
                        /*$a_lt_light[1:0] = $reset
                                        ? 2'b11://red
                                        !$cycle
                                        ? >>1$a_lt_light:
                                        $cycle & ((>>1$all_red & (>>2$a_lt_light == 2'b11)))
                                        ? 2'b00://green
                                        $cycle & ((>>1$a_lt_light == 2'b00)| (>>2$a_lt_light == 2'b00) | (>>3$a_lt_light == 2'b00))
                                        ? 2'b01://yellow
                                        2'b11;//red
                        */
                        assign FpgaPins_Fpga_TRAFFIC_turn_a1[1:0] = FpgaPins_Fpga_TRAFFIC_reset_a1 | FpgaPins_Fpga_TRAFFIC_reset_a2
                                   ? 2'b00:
                                   !FpgaPins_Fpga_TRAFFIC_cycle_a1
                                   ? FpgaPins_Fpga_TRAFFIC_turn_a2:
                                   FpgaPins_Fpga_TRAFFIC_turn_a2 +1;
            
                        assign FpgaPins_Fpga_TRAFFIC_all_red_a1 = FpgaPins_Fpga_TRAFFIC_reset_a1 | FpgaPins_Fpga_TRAFFIC_reset_a2
                                   ? 1'b1://red
                                   !FpgaPins_Fpga_TRAFFIC_cycle_a1
                                   ? FpgaPins_Fpga_TRAFFIC_all_red_a2:
                                   FpgaPins_Fpga_TRAFFIC_cycle_a1 & (FpgaPins_Fpga_TRAFFIC_turn_a1 == 2'b00)
                                   ? 1'b1:
                                   1'b0;
                     //light hookup
                     //_/light_lt
                        //_@1
                           assign FpgaPins_Fpga_TRAFFIC_LightLt_rs_a1 = FpgaPins_Fpga_TRAFFIC_reset_a1;
                           assign FpgaPins_Fpga_TRAFFIC_LightLt_light_a1[1:0] = FpgaPins_Fpga_TRAFFIC_LightLt_rs_a1
                                        ? 2'b11://red
                                        !FpgaPins_Fpga_TRAFFIC_cycle_a1
                                        ? FpgaPins_Fpga_TRAFFIC_LightLt_light_a2:
                                        FpgaPins_Fpga_TRAFFIC_cycle_a1 & (!FpgaPins_Fpga_TRAFFIC_all_red_a1 & FpgaPins_Fpga_TRAFFIC_all_red_a2)
                                        ? 2'b00://green
                                        FpgaPins_Fpga_TRAFFIC_cycle_a1 & ((FpgaPins_Fpga_TRAFFIC_LightLt_light_a2 == 2'b00))
                                        ? 2'b01://yellow
                                        2'b01;//yellow
                     //_/light
                        //_@1
                           assign FpgaPins_Fpga_TRAFFIC_Light_rs_a1 = FpgaPins_Fpga_TRAFFIC_reset_a1;
                           assign FpgaPins_Fpga_TRAFFIC_Light_light_a1[1:0] = FpgaPins_Fpga_TRAFFIC_Light_rs_a1
                                        ? 2'b11://red
                                        !FpgaPins_Fpga_TRAFFIC_cycle_a1
                                        ? FpgaPins_Fpga_TRAFFIC_Light_light_a2:
                                        FpgaPins_Fpga_TRAFFIC_cycle_a1 & (FpgaPins_Fpga_TRAFFIC_LightLt_light_a2 == 2'b00)
                                        ? 2'b00://green
                                        FpgaPins_Fpga_TRAFFIC_cycle_a1 & ((FpgaPins_Fpga_TRAFFIC_Light_light_a2 == 2'b00))
                                        ? 2'b01://yellow
                                        2'b11;//red
            
                     //_?$ba
                        //_@1
                           assign FpgaPins_Fpga_TRAFFIC_b_lt_light_a1[1:0] = FpgaPins_Fpga_TRAFFIC_reset_a1
                                        ? 2'b11:
                                        !FpgaPins_Fpga_TRAFFIC_cycle_a1
                                        ? FpgaPins_Fpga_TRAFFIC_b_lt_light_a2:
                                        FpgaPins_Fpga_TRAFFIC_LightLt_light_a1[1:0];
                           assign FpgaPins_Fpga_TRAFFIC_b_light_a1[1:0] = FpgaPins_Fpga_TRAFFIC_reset_a1
                                        ? 2'b11:
                                        !FpgaPins_Fpga_TRAFFIC_cycle_a1
                                        ? FpgaPins_Fpga_TRAFFIC_b_light_a2:
                                        FpgaPins_Fpga_TRAFFIC_Light_light_a1[1:0];
            
                     //_?$ab
                        //_@1
                           assign FpgaPins_Fpga_TRAFFIC_a_lt_light_a1[1:0] = FpgaPins_Fpga_TRAFFIC_reset_a1
                                        ? 2'b11:
                                        !FpgaPins_Fpga_TRAFFIC_cycle_a1
                                        ? FpgaPins_Fpga_TRAFFIC_a_lt_light_a2:
                                        FpgaPins_Fpga_TRAFFIC_LightLt_light_a1[1:0];
                           assign FpgaPins_Fpga_TRAFFIC_a_light_a1[1:0] = FpgaPins_Fpga_TRAFFIC_reset_a1
                                        ? 2'b11:
                                        !FpgaPins_Fpga_TRAFFIC_cycle_a1
                                        ? FpgaPins_Fpga_TRAFFIC_a_light_a2:
                                        FpgaPins_Fpga_TRAFFIC_Light_light_a1[1:0];
            
                  //_@2//output with 2 digit display
                     //$display_1
                     //$display_2
                     //ABAlBl
                     assign uio_oe = 8'b1;
                     assign uio_out = //RRRR
                                 (FpgaPins_Fpga_TRAFFIC_all_red_a2 & FpgaPins_Fpga_TRAFFIC_sel_a2)
                                 ? 8'b10111001:
                                 (FpgaPins_Fpga_TRAFFIC_all_red_a2 & !FpgaPins_Fpga_TRAFFIC_sel_a2)
                                 ?  8'b00001111:
                                 //RRRG
                                 (FpgaPins_Fpga_TRAFFIC_ba_a2 & (FpgaPins_Fpga_TRAFFIC_b_lt_light_a2 == 2'b00) & FpgaPins_Fpga_TRAFFIC_sel_a2)
                                  ? 8'b10011000:
                                 (FpgaPins_Fpga_TRAFFIC_ba_a2 & (FpgaPins_Fpga_TRAFFIC_b_lt_light_a2 == 2'b00) & !FpgaPins_Fpga_TRAFFIC_sel_a2)
                                 ? 8'b00000011:
                                 //RGRY
                                 (FpgaPins_Fpga_TRAFFIC_ba_a2 & (FpgaPins_Fpga_TRAFFIC_b_lt_light_a2 == 2'b01) & (FpgaPins_Fpga_TRAFFIC_b_light_a2 == 2'b00) & FpgaPins_Fpga_TRAFFIC_sel_a2)
                                 ? 8'b10010100:
                                 (FpgaPins_Fpga_TRAFFIC_ba_a2 & (FpgaPins_Fpga_TRAFFIC_b_lt_light_a2 == 2'b01) & (FpgaPins_Fpga_TRAFFIC_b_light_a2 == 2'b00) & !FpgaPins_Fpga_TRAFFIC_sel_a2)
                                 ?  8'b00100010:
                                 //RYRY
                                 (FpgaPins_Fpga_TRAFFIC_ba_a2 & (FpgaPins_Fpga_TRAFFIC_b_lt_light_a2 == 2'b01) & (FpgaPins_Fpga_TRAFFIC_b_light_a2 == 2'b01) & FpgaPins_Fpga_TRAFFIC_sel_a2)
                                 ? 8'b10011100:
                                 (FpgaPins_Fpga_TRAFFIC_ba_a2 & (FpgaPins_Fpga_TRAFFIC_b_lt_light_a2 == 2'b01) & (FpgaPins_Fpga_TRAFFIC_b_light_a2 == 2'b01) & !FpgaPins_Fpga_TRAFFIC_sel_a2)
                                 ? 8'b00100011:
                                 //RRRR
                                 //($digit[4] & $sel)
                                 //? 8'b00111001:
                                 //($digit[4] & !$sel)
                                 //? 8'b10001111:
                                 //RRGR
                                 (FpgaPins_Fpga_TRAFFIC_ab_a2 & (FpgaPins_Fpga_TRAFFIC_a_lt_light_a2 == 2'b00) & FpgaPins_Fpga_TRAFFIC_sel_a2)
                                 ? 8'b10100001:
                                 (FpgaPins_Fpga_TRAFFIC_ab_a2 & (FpgaPins_Fpga_TRAFFIC_a_lt_light_a2 == 2'b00) & !FpgaPins_Fpga_TRAFFIC_sel_a2)
                                 ? 8'b00001100:
                                 //GRYR
                                 (FpgaPins_Fpga_TRAFFIC_ab_a2 & (FpgaPins_Fpga_TRAFFIC_a_lt_light_a2 == 2'b01) & (FpgaPins_Fpga_TRAFFIC_a_light_a2 == 2'b00) & FpgaPins_Fpga_TRAFFIC_sel_a2)
                                 ?  8'b11000001:
                                 (FpgaPins_Fpga_TRAFFIC_ab_a2 & (FpgaPins_Fpga_TRAFFIC_a_lt_light_a2 == 2'b01) & (FpgaPins_Fpga_TRAFFIC_a_light_a2 == 2'b00) & !FpgaPins_Fpga_TRAFFIC_sel_a2)
                                  ? 8'b01001000:
                                 //YRYR
                                 (FpgaPins_Fpga_TRAFFIC_ab_a2 & (FpgaPins_Fpga_TRAFFIC_a_lt_light_a2 == 2'b01) & (FpgaPins_Fpga_TRAFFIC_a_light_a2 == 2'b01) & FpgaPins_Fpga_TRAFFIC_sel_a2)
                                 ? 8'b01011000:
                                 (FpgaPins_Fpga_TRAFFIC_ab_a2 & (FpgaPins_Fpga_TRAFFIC_a_lt_light_a2 == 2'b01) & (FpgaPins_Fpga_TRAFFIC_a_light_a2 == 2'b01) & !FpgaPins_Fpga_TRAFFIC_sel_a2)
                                 ?  8'b11000011:
                                 FpgaPins_Fpga_TRAFFIC_sel_a2 //all red safe state
                                 ?8'b0:
                                 8'b10;
            
            
               // Note that pipesignals assigned here can be found under /fpga_pins/fpga.
            
            
            
            
               // Connect Tiny Tapeout outputs. Note that uio_ outputs are not available in the Tiny-Tapeout-3-based FPGA boards.
               //*uo_out = 8'b0;
               //*uio_oe = 8'b1;
               assign uio_out = 8'b0;
               assign uio_oe = 8'b0;
            //_\end_source
   
      // LEDs.
      
   
      // 7-Segment
      //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 395   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 346 as: m4+fpga_sseg.
         for (digit = 0; digit <= 0; digit++) begin : L1_Digit //_/digit
            
            for (leds = 0; leds <= 7; leds++) begin : L2_Leds //_/leds

               // For $viz_lit.
               logic L2_viz_lit_a0;

               assign L2_viz_lit_a0 = (! L0_sseg_digit_n_a0[digit]) && ! ((leds == 7) ? L0_sseg_decimal_point_n_a0 : L0_sseg_segment_n_a0[leds % 7]);
               
            end
         end
      //_\end_source
   
      // slideswitches
      //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 454   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 349 as: m4+fpga_switch.
         for (switch = 0; switch <= 7; switch++) begin : L1_Switch //_/switch

            // For $viz_switch.
            logic L1_viz_switch_a0;

            assign L1_viz_switch_a0 = L0_slideswitch_a0[switch];
            
         end
      //_\end_source
   
      // pushbuttons
      
   //_\end_source
   // Label the switch inputs [0..7] (1..8 on the physical switch panel) (top-to-bottom).
   //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlvlib/tinytapeoutlib.tlv 82   // Instantiated from top.tlv, 305 as: m5+tt_input_labels_viz(⌈"UNUSED", "UNUSED", "UNUSED", "UNUSED", "UNUSED", "UNUSED", "UNUSED", "UNUSED"⌉)
      for (input_label = 0; input_label <= 7; input_label++) begin : L1_InputLabel //_/input_label
         
      end
   //_\end_source

//_\SV
endmodule


// Undefine macros defined by SandPiper.
`undef BOGUS_USE
