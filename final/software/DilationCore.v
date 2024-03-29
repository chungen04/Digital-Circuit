// -------------------------------------------------------------
// 
// File Name: C:\Users\team06\Documents\MATLAB\Examples\R2022b\visionhdl\BlobAnalysisExample\verilog_hdl\BlobAnalysisHDL\DilationCore.v
// Created: 2022-12-23 11:30:02
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: DilationCore
// Source Path: BlobAnalysisHDL/BlobDetector/CCA_Algorithm/Closing/DilationCore
// Hierarchy Level: 3
// 
// Find local maxima in binary image
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module DilationCore
          (clk,
           reset,
           enb,
           pixelInVec_0,
           pixelInVec_1,
           pixelInVec_2,
           pixelInVec_3,
           hStartIn,
           hEndIn,
           vStartIn,
           vEndIn,
           validIn,
           processData,
           pixelOut,
           hStartOut,
           hEndOut,
           vStartOut,
           vEndOut,
           validOut);


  input   clk;
  input   reset;
  input   enb;
  input   pixelInVec_0;  // boolean
  input   pixelInVec_1;  // boolean
  input   pixelInVec_2;  // boolean
  input   pixelInVec_3;  // boolean
  input   hStartIn;
  input   hEndIn;
  input   vStartIn;
  input   vEndIn;
  input   validIn;
  input   processData;
  output  pixelOut;
  output  hStartOut;
  output  hEndOut;
  output  vStartOut;
  output  vEndOut;
  output  validOut;


  reg  pixelsel;
  wire validKernelValidOut;
  wire falseout;
  wire [0:3] nhood1;  // boolean [4]
  wire nhood1_0;
  wire nhood1_0_1;
  wire nhood1_1;
  wire nhood1_1_1;
  wire nhood1_2;
  wire nhood1_2_1;
  wire nhood1_3;
  wire [0:3] nhood2;  // boolean [4]
  wire nhood2_0;
  wire [0:3] pixelInVec;  // boolean [4]
  reg  [0:3] datareg1;  // boolean [4]
  wire nhood2_1;
  wire nhood2_2;
  wire nhood2_3;
  wire [0:3] nhood3;  // boolean [4]
  wire nhood3_0;
  reg  [0:3] datareg2;  // boolean [4]
  wire nhood3_1;
  wire nhood3_2;
  wire nhood3_3;
  wire [0:3] nhood4;  // boolean [4]
  wire nhood4_0;
  reg  [0:3] datareg3;  // boolean [4]
  wire nhood4_1;
  wire nhood4_2;
  wire nhood4_3;
  wire nhood1_3_1;
  wire or_col1;
  wire datareg1_0;
  wire nhood2_0_1;
  wire datareg1_1;
  wire nhood2_1_1;
  wire datareg1_2;
  wire nhood2_2_1;
  wire datareg1_3;
  wire nhood2_3_1;
  wire or_col2;
  wire datareg2_0;
  wire nhood3_0_1;
  wire datareg2_1;
  wire nhood3_1_1;
  wire datareg2_2;
  wire nhood3_2_1;
  wire datareg2_3;
  wire nhood3_3_1;
  wire or_col3;
  wire datareg3_0;
  wire nhood4_0_1;
  wire datareg3_1;
  wire nhood4_1_1;
  wire datareg3_2;
  wire nhood4_2_1;
  wire datareg3_3;
  wire nhood4_3_1;
  wire or_col4;
  wire finalor;
  wire validpixel;
  reg  pixelOut_1;
  reg  hStartKernelOut;
  wire hStartKernelValidOut;
  reg  hStartOut_1;
  reg  hEndKernelOut;
  wire hEndKernelValidOut;
  reg  hEndOut_1;
  reg  vStartKernelOut;
  wire vStartKernelValidOut;
  reg  vStartOut_1;
  reg  vEndKernelOut;
  wire vEndKernelValidOut;
  reg  vEndOut_1;
  reg  validOut_1;


  always @(posedge clk or posedge reset)
    begin : intdelay_process
      if (reset == 1'b1) begin
        pixelsel <= 1'b0;
      end
      else begin
        if (enb && processData) begin
          pixelsel <= validIn;
        end
      end
    end



  assign validKernelValidOut = pixelsel & processData;



  // Constant zero
  assign falseout = 1'b0;



  // Neighborhood
  assign nhood1[0] = 1'b1;
  assign nhood1[1] = 1'b1;
  assign nhood1[2] = 1'b1;
  assign nhood1[3] = 1'b1;



  assign nhood1_0 = nhood1[0];

  assign nhood1_0_1 = nhood1_0 & pixelInVec_0;



  assign nhood1_1 = nhood1[1];

  assign nhood1_1_1 = nhood1_1 & pixelInVec_1;



  assign nhood1_2 = nhood1[2];

  assign nhood1_2_1 = nhood1_2 & pixelInVec_2;



  assign nhood1_3 = nhood1[3];

  // Neighborhood
  assign nhood2[0] = 1'b1;
  assign nhood2[1] = 1'b1;
  assign nhood2[2] = 1'b1;
  assign nhood2[3] = 1'b1;



  assign nhood2_0 = nhood2[0];

  assign pixelInVec[0] = pixelInVec_0;
  assign pixelInVec[1] = pixelInVec_1;
  assign pixelInVec[2] = pixelInVec_2;
  assign pixelInVec[3] = pixelInVec_3;

  always @(posedge clk or posedge reset)
    begin : reg_rsvd_process
      if (reset == 1'b1) begin
        datareg1[0] <= 1'b0;
        datareg1[1] <= 1'b0;
        datareg1[2] <= 1'b0;
        datareg1[3] <= 1'b0;
      end
      else begin
        if (enb && processData) begin
          datareg1[0] <= pixelInVec[0];
          datareg1[1] <= pixelInVec[1];
          datareg1[2] <= pixelInVec[2];
          datareg1[3] <= pixelInVec[3];
        end
      end
    end



  assign nhood2_1 = nhood2[1];

  assign nhood2_2 = nhood2[2];

  assign nhood2_3 = nhood2[3];

  // Neighborhood
  assign nhood3[0] = 1'b1;
  assign nhood3[1] = 1'b1;
  assign nhood3[2] = 1'b1;
  assign nhood3[3] = 1'b1;



  assign nhood3_0 = nhood3[0];

  always @(posedge clk or posedge reset)
    begin : reg_rsvd_1_process
      if (reset == 1'b1) begin
        datareg2[0] <= 1'b0;
        datareg2[1] <= 1'b0;
        datareg2[2] <= 1'b0;
        datareg2[3] <= 1'b0;
      end
      else begin
        if (enb && processData) begin
          datareg2[0] <= datareg1[0];
          datareg2[1] <= datareg1[1];
          datareg2[2] <= datareg1[2];
          datareg2[3] <= datareg1[3];
        end
      end
    end



  assign nhood3_1 = nhood3[1];

  assign nhood3_2 = nhood3[2];

  assign nhood3_3 = nhood3[3];

  // Neighborhood
  assign nhood4[0] = 1'b1;
  assign nhood4[1] = 1'b1;
  assign nhood4[2] = 1'b1;
  assign nhood4[3] = 1'b1;



  assign nhood4_0 = nhood4[0];

  always @(posedge clk or posedge reset)
    begin : reg_rsvd_2_process
      if (reset == 1'b1) begin
        datareg3[0] <= 1'b0;
        datareg3[1] <= 1'b0;
        datareg3[2] <= 1'b0;
        datareg3[3] <= 1'b0;
      end
      else begin
        if (enb && processData) begin
          datareg3[0] <= datareg2[0];
          datareg3[1] <= datareg2[1];
          datareg3[2] <= datareg2[2];
          datareg3[3] <= datareg2[3];
        end
      end
    end



  assign nhood4_1 = nhood4[1];

  assign nhood4_2 = nhood4[2];

  assign nhood4_3 = nhood4[3];

  // Finding local maxima
  assign nhood1_3_1 = nhood1_3 & pixelInVec_3;



  assign or_col1 = nhood1_3_1 | (nhood1_2_1 | (nhood1_0_1 | nhood1_1_1));



  assign datareg1_0 = datareg1[0];

  assign nhood2_0_1 = nhood2_0 & datareg1_0;



  assign datareg1_1 = datareg1[1];

  assign nhood2_1_1 = nhood2_1 & datareg1_1;



  assign datareg1_2 = datareg1[2];

  assign nhood2_2_1 = nhood2_2 & datareg1_2;



  assign datareg1_3 = datareg1[3];

  assign nhood2_3_1 = nhood2_3 & datareg1_3;



  assign or_col2 = nhood2_3_1 | (nhood2_2_1 | (nhood2_0_1 | nhood2_1_1));



  assign datareg2_0 = datareg2[0];

  assign nhood3_0_1 = nhood3_0 & datareg2_0;



  assign datareg2_1 = datareg2[1];

  assign nhood3_1_1 = nhood3_1 & datareg2_1;



  assign datareg2_2 = datareg2[2];

  assign nhood3_2_1 = nhood3_2 & datareg2_2;



  assign datareg2_3 = datareg2[3];

  assign nhood3_3_1 = nhood3_3 & datareg2_3;



  assign or_col3 = nhood3_3_1 | (nhood3_2_1 | (nhood3_0_1 | nhood3_1_1));



  assign datareg3_0 = datareg3[0];

  assign nhood4_0_1 = nhood4_0 & datareg3_0;



  assign datareg3_1 = datareg3[1];

  assign nhood4_1_1 = nhood4_1 & datareg3_1;



  assign datareg3_2 = datareg3[2];

  assign nhood4_2_1 = nhood4_2 & datareg3_2;



  assign datareg3_3 = datareg3[3];

  assign nhood4_3_1 = nhood4_3 & datareg3_3;



  assign or_col4 = nhood4_3_1 | (nhood4_2_1 | (nhood4_0_1 | nhood4_1_1));



  assign finalor = or_col4 | (or_col3 | (or_col1 | or_col2));



  assign validpixel = (validKernelValidOut == 1'b0 ? falseout :
              finalor);



  always @(posedge clk or posedge reset)
    begin : intdelay_1_process
      if (reset == 1'b1) begin
        pixelOut_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          pixelOut_1 <= validpixel;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_2_process
      if (reset == 1'b1) begin
        hStartKernelOut <= 1'b0;
      end
      else begin
        if (enb && processData) begin
          hStartKernelOut <= hStartIn;
        end
      end
    end



  assign hStartKernelValidOut = hStartKernelOut & processData;



  always @(posedge clk or posedge reset)
    begin : intdelay_3_process
      if (reset == 1'b1) begin
        hStartOut_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          hStartOut_1 <= hStartKernelValidOut;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_4_process
      if (reset == 1'b1) begin
        hEndKernelOut <= 1'b0;
      end
      else begin
        if (enb && processData) begin
          hEndKernelOut <= hEndIn;
        end
      end
    end



  assign hEndKernelValidOut = hEndKernelOut & processData;



  always @(posedge clk or posedge reset)
    begin : intdelay_5_process
      if (reset == 1'b1) begin
        hEndOut_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          hEndOut_1 <= hEndKernelValidOut;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_6_process
      if (reset == 1'b1) begin
        vStartKernelOut <= 1'b0;
      end
      else begin
        if (enb && processData) begin
          vStartKernelOut <= vStartIn;
        end
      end
    end



  assign vStartKernelValidOut = vStartKernelOut & processData;



  always @(posedge clk or posedge reset)
    begin : intdelay_7_process
      if (reset == 1'b1) begin
        vStartOut_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          vStartOut_1 <= vStartKernelValidOut;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_8_process
      if (reset == 1'b1) begin
        vEndKernelOut <= 1'b0;
      end
      else begin
        if (enb && processData) begin
          vEndKernelOut <= vEndIn;
        end
      end
    end



  assign vEndKernelValidOut = vEndKernelOut & processData;



  always @(posedge clk or posedge reset)
    begin : intdelay_9_process
      if (reset == 1'b1) begin
        vEndOut_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          vEndOut_1 <= vEndKernelValidOut;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_10_process
      if (reset == 1'b1) begin
        validOut_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          validOut_1 <= validKernelValidOut;
        end
      end
    end



  assign pixelOut = pixelOut_1;

  assign hStartOut = hStartOut_1;

  assign hEndOut = hEndOut_1;

  assign vStartOut = vStartOut_1;

  assign vEndOut = vEndOut_1;

  assign validOut = validOut_1;

endmodule  // DilationCore

