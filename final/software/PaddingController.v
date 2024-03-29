// -------------------------------------------------------------
// 
// File Name: C:\Users\team06\Documents\MATLAB\Examples\R2022b\visionhdl\BlobAnalysisExample\verilog_hdl\BlobAnalysisHDL\PaddingController.v
// Created: 2022-12-23 11:30:02
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: PaddingController
// Source Path: BlobAnalysisHDL/BlobDetector/CCA_Algorithm/Closing/LineBuffer/PaddingController
// Hierarchy Level: 4
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module PaddingController
          (clk,
           reset,
           enb,
           PrePadFlag,
           OnLineFlag,
           alphaPostPadFlag,
           DumpingFlag,
           BlankingFlag,
           processData,
           countReset,
           countEn,
           dumpControl,
           PrePadding);


  input   clk;
  input   reset;
  input   enb;
  input   PrePadFlag;
  input   OnLineFlag;
  input   alphaPostPadFlag;
  input   DumpingFlag;
  input   BlankingFlag;
  output  processData;
  output  countReset;
  output  countEn;
  output  dumpControl;
  output  PrePadding;


  reg [2:0] PaddingController_FSMState;  // ufix3
  reg [2:0] PaddingController_FSMState_next;  // ufix3
  reg  processData_1;
  reg  countReset_1;
  reg  countEn_1;
  reg  dumpControl_1;
  reg  PrePadding_1;


  // Padding Controller
  always @(posedge clk or posedge reset)
    begin : PaddingController_1_process
      if (reset == 1'b1) begin
        PaddingController_FSMState <= 3'b000;
      end
      else begin
        if (enb) begin
          PaddingController_FSMState <= PaddingController_FSMState_next;
        end
      end
    end

  always @(BlankingFlag, DumpingFlag, OnLineFlag, PaddingController_FSMState, PrePadFlag,
       alphaPostPadFlag) begin
    PaddingController_FSMState_next = PaddingController_FSMState;
    case ( PaddingController_FSMState)
      3'b000 :
        begin
          processData_1 = 1'b0;
          countReset_1 = 1'b1;
          countEn_1 = 1'b0;
          dumpControl_1 = 1'b0;
          PrePadding_1 = 1'b0;
          if (PrePadFlag != 1'b0) begin
            PaddingController_FSMState_next = 3'b001;
          end
          else begin
            PaddingController_FSMState_next = 3'b000;
          end
        end
      3'b001 :
        begin
          processData_1 = 1'b1;
          countReset_1 = 1'b0;
          countEn_1 = 1'b1;
          dumpControl_1 = 1'b0;
          PrePadding_1 = 1'b1;
          if (OnLineFlag != 1'b0) begin
            PaddingController_FSMState_next = 3'b010;
          end
          else begin
            PaddingController_FSMState_next = 3'b001;
          end
        end
      3'b010 :
        begin
          processData_1 = 1'b1;
          countReset_1 = 1'b0;
          countEn_1 = 1'b0;
          dumpControl_1 = 1'b0;
          PrePadding_1 = 1'b0;
          if (DumpingFlag != 1'b0) begin
            PaddingController_FSMState_next = 3'b011;
          end
          else begin
            PaddingController_FSMState_next = 3'b010;
          end
        end
      3'b011 :
        begin
          processData_1 = 1'b1;
          countReset_1 = 1'b0;
          countEn_1 = 1'b0;
          dumpControl_1 = 1'b1;
          PrePadding_1 = 1'b0;
          if (alphaPostPadFlag != 1'b0) begin
            PaddingController_FSMState_next = 3'b100;
          end
          else begin
            PaddingController_FSMState_next = 3'b011;
          end
        end
      3'b100 :
        begin
          processData_1 = 1'b1;
          countReset_1 = 1'b0;
          countEn_1 = 1'b1;
          dumpControl_1 = 1'b1;
          PrePadding_1 = 1'b0;
          if (BlankingFlag != 1'b0) begin
            PaddingController_FSMState_next = 3'b000;
          end
          else begin
            PaddingController_FSMState_next = 3'b100;
          end
        end
      default :
        begin
          processData_1 = 1'b0;
          countReset_1 = 1'b0;
          countEn_1 = 1'b0;
          dumpControl_1 = 1'b0;
          PrePadding_1 = 1'b0;
        end
    endcase
  end



  assign processData = processData_1;

  assign countReset = countReset_1;

  assign countEn = countEn_1;

  assign dumpControl = dumpControl_1;

  assign PrePadding = PrePadding_1;

endmodule  // PaddingController

