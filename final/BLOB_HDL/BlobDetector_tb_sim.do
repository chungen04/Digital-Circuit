onbreak resume
onerror resume
vsim -voptargs=+acc work.BlobDetector_tb

add wave sim:/BlobDetector_tb/u_BlobDetector/clk
add wave sim:/BlobDetector_tb/u_BlobDetector/reset
add wave sim:/BlobDetector_tb/u_BlobDetector/clk_enable
add wave sim:/BlobDetector_tb/u_BlobDetector/pixelInR
add wave sim:/BlobDetector_tb/u_BlobDetector/pixelInG
add wave sim:/BlobDetector_tb/u_BlobDetector/pixelInB
add wave sim:/BlobDetector_tb/u_BlobDetector/ctrlIn_hStart
add wave sim:/BlobDetector_tb/u_BlobDetector/ctrlIn_hEnd
add wave sim:/BlobDetector_tb/u_BlobDetector/ctrlIn_vStart
add wave sim:/BlobDetector_tb/u_BlobDetector/ctrlIn_vEnd
add wave sim:/BlobDetector_tb/u_BlobDetector/ctrlIn_valid
add wave sim:/BlobDetector_tb/u_BlobDetector/GradThresh
add wave sim:/BlobDetector_tb/u_BlobDetector/AreaThresh
add wave sim:/BlobDetector_tb/u_BlobDetector/CloseOp
add wave sim:/BlobDetector_tb/u_BlobDetector/VideoMode
add wave sim:/BlobDetector_tb/u_BlobDetector/blobIndex
add wave sim:/BlobDetector_tb/u_BlobDetector/ce_out
add wave sim:/BlobDetector_tb/u_BlobDetector/pixelOutR
add wave sim:/BlobDetector_tb/pixelOutR_ref
add wave sim:/BlobDetector_tb/u_BlobDetector/pixelOutG
add wave sim:/BlobDetector_tb/pixelOutG_ref
add wave sim:/BlobDetector_tb/u_BlobDetector/pixelOutB
add wave sim:/BlobDetector_tb/pixelOutB_ref
add wave sim:/BlobDetector_tb/u_BlobDetector/ctrlOut_hStart
add wave sim:/BlobDetector_tb/ctrlOut_hStart_ref
add wave sim:/BlobDetector_tb/u_BlobDetector/ctrlOut_hEnd
add wave sim:/BlobDetector_tb/ctrlOut_hEnd_ref
add wave sim:/BlobDetector_tb/u_BlobDetector/ctrlOut_vStart
add wave sim:/BlobDetector_tb/ctrlOut_vStart_ref
add wave sim:/BlobDetector_tb/u_BlobDetector/ctrlOut_vEnd
add wave sim:/BlobDetector_tb/ctrlOut_vEnd_ref
add wave sim:/BlobDetector_tb/u_BlobDetector/ctrlOut_valid
add wave sim:/BlobDetector_tb/ctrlOut_valid_ref
add wave sim:/BlobDetector_tb/u_BlobDetector/x_o
add wave sim:/BlobDetector_tb/x_o_ref
add wave sim:/BlobDetector_tb/u_BlobDetector/y_o
add wave sim:/BlobDetector_tb/y_o_ref
add wave sim:/BlobDetector_tb/u_BlobDetector/area_o
add wave sim:/BlobDetector_tb/area_o_ref
add wave sim:/BlobDetector_tb/u_BlobDetector/bbox_x1_o
add wave sim:/BlobDetector_tb/bbox_x1_o_ref
add wave sim:/BlobDetector_tb/u_BlobDetector/bbox_y1_o
add wave sim:/BlobDetector_tb/bbox_y1_o_ref
add wave sim:/BlobDetector_tb/u_BlobDetector/bbox_x2_o
add wave sim:/BlobDetector_tb/bbox_x2_o_ref
add wave sim:/BlobDetector_tb/u_BlobDetector/bbox_y2_o
add wave sim:/BlobDetector_tb/bbox_y2_o_ref
add wave sim:/BlobDetector_tb/u_BlobDetector/fbidx_o
add wave sim:/BlobDetector_tb/fbidx_o_ref
add wave sim:/BlobDetector_tb/u_BlobDetector/num_o
add wave sim:/BlobDetector_tb/num_o_ref
add wave sim:/BlobDetector_tb/u_BlobDetector/data_ready_o
add wave sim:/BlobDetector_tb/data_ready_o_ref
add wave sim:/BlobDetector_tb/u_BlobDetector/totalNum_o
add wave sim:/BlobDetector_tb/totalNum_o_ref
run -all
