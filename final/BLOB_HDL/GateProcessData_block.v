// -------------------------------------------------------------
// 
// File Name: C:\Users\team06\Documents\MATLAB\Examples\R2022b\visionhdl\BlobAnalysisExample\verilog_hdl\BlobAnalysisHDL\GateProcessData_block.v
// Created: 2022-12-23 11:30:02
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: GateProcessData_block
// Source Path: BlobAnalysisHDL/BlobDetector/CCA_Algorithm/Closing/LineBuffer/GateProcessData
// Hierarchy Level: 4
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module GateProcessData_block
          (clk,
           reset,
           enb,
           processDataIn,
           validIn,
           dumping,
           outputData,
           processData,
           dumpOrValid);


  input   clk;
  input   reset;
  input   enb;
  input   processDataIn;
  input   validIn;
  input   dumping;
  input   outputData;
  output  processData;
  output  dumpOrValid;


  wire processNull;
  reg  validREG;
  wire validOrDumping;
  wire processValid;


  assign processNull = 1'b0;



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_process
      if (reset == 1'b1) begin
        validREG <= 1'b0;
      end
      else begin
        if (enb) begin
          validREG <= validIn;
        end
      end
    end



  assign validOrDumping = validREG | dumping;



  assign processValid = processDataIn & validOrDumping;



  assign processData = (outputData == 1'b0 ? processNull :
              processValid);



  assign dumpOrValid = validOrDumping;

endmodule  // GateProcessData_block

