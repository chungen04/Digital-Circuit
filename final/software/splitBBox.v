// -------------------------------------------------------------
// 
// File Name: C:\Users\team06\Documents\MATLAB\Examples\R2022b\visionhdl\BlobAnalysisExample\verilog_hdl\BlobAnalysisHDL\splitBBox.v
// Created: 2022-12-23 11:30:02
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: splitBBox
// Source Path: BlobAnalysisHDL/BlobDetector/CacheResultForXfer/splitBBox
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module splitBBox
          (In1,
           X1,
           Y1,
           X2,
           Y2);


  input   [33:0] In1;  // ufix34
  output  [8:0] X1;  // ufix9
  output  [7:0] Y1;  // uint8
  output  [8:0] X2;  // ufix9
  output  [7:0] Y2;  // uint8




  assign X1 = In1[33:25];



  assign Y1 = In1[24:17];



  assign X2 = In1[16:8];



  assign Y2 = In1[7:0];



endmodule  // splitBBox

