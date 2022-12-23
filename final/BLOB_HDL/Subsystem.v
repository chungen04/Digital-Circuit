// -------------------------------------------------------------
// 
// File Name: C:\Users\team06\Documents\MATLAB\Examples\R2022b\visionhdl\BlobAnalysisExample\verilog_hdl\BlobAnalysisHDL\Subsystem.v
// Created: 2022-12-23 11:30:02
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Subsystem
// Source Path: BlobAnalysisHDL/BlobDetector/CCA_Algorithm/cca/Subsystem
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Subsystem
          (clk,
           reset,
           enb,
           alphahStart,
           alphahEnd,
           Out1);


  input   clk;
  input   reset;
  input   enb;
  input   alphahStart;
  input   alphahEnd;
  output  Out1;


  reg  Delay_out1;
  reg  [0:1] Delay2_reg;  // ufix1 [2]
  wire [0:1] Delay2_reg_next;  // ufix1 [2]
  wire Delay2_out1;
  reg  Delay3_out1;
  wire OR2_out1;
  reg  Delay4_out1;
  reg  Delay5_out1;
  reg  Delay6_out1;
  reg  Delay7_out1;
  wire OR3_out1;
  wire OR6_out1;


  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        Delay_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay_out1 <= alphahStart;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay2_process
      if (reset == 1'b1) begin
        Delay2_reg[0] <= 1'b0;
        Delay2_reg[1] <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay2_reg[0] <= Delay2_reg_next[0];
          Delay2_reg[1] <= Delay2_reg_next[1];
        end
      end
    end

  assign Delay2_out1 = Delay2_reg[1];
  assign Delay2_reg_next[0] = Delay_out1;
  assign Delay2_reg_next[1] = Delay2_reg[0];



  always @(posedge clk or posedge reset)
    begin : Delay3_process
      if (reset == 1'b1) begin
        Delay3_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay3_out1 <= Delay2_out1;
        end
      end
    end



  assign OR2_out1 = Delay2_out1 | (Delay3_out1 | (alphahStart | Delay_out1));



  always @(posedge clk or posedge reset)
    begin : Delay4_process
      if (reset == 1'b1) begin
        Delay4_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay4_out1 <= alphahEnd;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay5_process
      if (reset == 1'b1) begin
        Delay5_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay5_out1 <= Delay4_out1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay6_process
      if (reset == 1'b1) begin
        Delay6_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay6_out1 <= Delay5_out1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay7_process
      if (reset == 1'b1) begin
        Delay7_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay7_out1 <= Delay6_out1;
        end
      end
    end



  assign OR3_out1 = Delay7_out1 | (Delay6_out1 | (Delay5_out1 | (alphahEnd | Delay4_out1)));



  assign OR6_out1 = OR2_out1 | OR3_out1;



  assign Out1 = OR6_out1;

endmodule  // Subsystem

