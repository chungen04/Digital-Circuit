// -------------------------------------------------------------
// 
// File Name: C:\Users\team06\Documents\MATLAB\Examples\R2022b\visionhdl\BlobAnalysisExample\verilog_hdl\BlobAnalysisHDL\bbox_store.v
// Created: 2022-12-23 11:30:02
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: bbox_store
// Source Path: BlobAnalysisHDL/BlobDetector/CCA_Algorithm/cca/bbox_store
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module bbox_store
          (clk,
           reset,
           enb,
           bbox_i,
           Rst,
           En,
           blobIdx,
           BBox);


  input   clk;
  input   reset;
  input   enb;
  input   [33:0] bbox_i;  // ufix34
  input   Rst;
  input   En;
  input   [9:0] blobIdx;  // ufix10
  output  [33:0] BBox;  // ufix34


  reg  xincr;
  wire Logical_Operator_out1;
  reg  wren;
  wire NOT_out1;
  reg [9:0] wraddr;  // ufix10
  wire Relational_Operator_relop1;
  reg  sameIdx;
  wire Logical_Operator1_out1;
  reg [33:0] xincr_1;  // ufix34
  wire [33:0] zero_out1;  // ufix34
  wire [33:0] din;  // ufix34
  reg [33:0] incrVal;  // ufix34
  wire [33:0] rdout;  // ufix34
  wire [33:0] dataAccumVal;  // ufix34
  wire [33:0] resolve_out1;  // ufix34
  wire [33:0] din_1;  // ufix34
  wire [33:0] wrout;  // ufix34


  always @(posedge clk or posedge reset)
    begin : Delay5_process
      if (reset == 1'b1) begin
        xincr <= 1'b0;
      end
      else begin
        if (enb) begin
          xincr <= Rst;
        end
      end
    end



  assign Logical_Operator_out1 = xincr | En;



  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        wren <= 1'b0;
      end
      else begin
        if (enb) begin
          wren <= Logical_Operator_out1;
        end
      end
    end



  assign NOT_out1 =  ~ wren;



  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        wraddr <= 10'b0000000000;
      end
      else begin
        if (enb) begin
          wraddr <= blobIdx;
        end
      end
    end



  assign Relational_Operator_relop1 = wraddr == blobIdx;



  always @(posedge clk or posedge reset)
    begin : Delay4_process
      if (reset == 1'b1) begin
        sameIdx <= 1'b0;
      end
      else begin
        if (enb) begin
          sameIdx <= Relational_Operator_relop1;
        end
      end
    end



  assign Logical_Operator1_out1 = xincr | NOT_out1;



  always @(posedge clk or posedge reset)
    begin : Delay6_process
      if (reset == 1'b1) begin
        xincr_1 <= 34'h000000000;
      end
      else begin
        if (enb) begin
          xincr_1 <= bbox_i;
        end
      end
    end



  assign zero_out1 = 34'h000000000;



  always @(posedge clk or posedge reset)
    begin : Delay2_process
      if (reset == 1'b1) begin
        incrVal <= 34'h000000000;
      end
      else begin
        if (enb) begin
          incrVal <= din;
        end
      end
    end



  assign dataAccumVal = (sameIdx == 1'b0 ? rdout :
              incrVal);



  resolve u_resolve (.fromRAM(dataAccumVal),  // ufix34
                     .bbox(xincr_1),  // ufix34
                     .toRAM(resolve_out1)  // ufix34
                     );

  assign din = (Logical_Operator1_out1 == 1'b0 ? resolve_out1 :
              zero_out1);



  assign din_1 = din;

  DualPortRAM_generic #(.AddrWidth(10),
                        .DataWidth(34)
                        )
                      u_Dual_Port_RAM_System (.clk(clk),
                                              .enb(enb),
                                              .wr_din(din_1),
                                              .wr_addr(wraddr),
                                              .wr_en(wren),
                                              .rd_addr(blobIdx),
                                              .wr_dout(wrout),
                                              .rd_dout(rdout)
                                              );

  assign BBox = rdout;

endmodule  // bbox_store
