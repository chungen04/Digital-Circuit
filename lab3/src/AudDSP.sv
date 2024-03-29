module AudDSP(
	input i_rst_n, //reset_n
	input i_clk, // bclk clock
	input i_start, // start signal 
	input i_pause, // pause signal
	input i_stop, // stop signal 
	input [2:0] i_speed, // 4 bit
	input i_fast, // (y/n?)
	input i_slow_0, // constant interpolation
	input i_slow_1, // linear interpolation
	input i_daclrck, // daclrck clock
	input [15:0] i_sram_data, // data to play from Top (signed)
	output [15:0] o_dac_data, // data to send to I2S, then to WM8731 (signed)
	output [19:0] o_sram_addr // next reading SRAM addr
);
/*
    questions:
    1. where is end of file (holded by Top)
    2. data is provided by Top

    protocols:
    1. if reaching end of file, Top send a stop signal (since the functionality is the same)
*/
/* 
    behavior:
    1. if receive i_start at IDLE state, next state is START.
    at this time fast, slow_0, slow_1 is either 0 or one of them is 1
    if all 0, play as usual
    2. upon receiving pause and stop, the next state will be the coresponding state. 

    assumptions:
    1. only one sound channel is present.
    0x1: first time frame data, left & right channel same
    0x10: second time frame data, left & right channel same
    2. start and stop at the same time is undefined.
*/
parameter S_IDLE = 0;
parameter S_START = 1;
parameter S_PAUSE = 2;
parameter S_WAIT = 3;
parameter S_WAIT_L = 4;

logic [2:0] state_r, state_w;
logic [19:0] sram_addr_r, sram_addr_w;
logic [15:0] dac_data_r, dac_data_w;
logic [3:0] counter_r, counter_w; // count for slow playing mode
logic signed [20:0] tmp1_w, tmp1_r, tmp2_w, tmp2_r; // register to hold value 

logic [3:0] speed;
assign speed = i_speed + 1;

assign o_dac_data = dac_data_r;
assign o_sram_addr = sram_addr_r;

always_comb begin
    state_w = state_r;
    counter_w = counter_r;
    tmp1_w = tmp1_r;
    tmp2_w = tmp2_r;
    sram_addr_w = sram_addr_r;
    dac_data_w = dac_data_r;

    case(state_r)
    S_IDLE: begin
        if(i_start) begin
            state_w = S_START;
        end
        sram_addr_w = 0;
        dac_data_w = 0;
        counter_w = 0;
    end
    S_START: begin
        counter_w = 0;
        if(i_stop) begin
            state_w = S_IDLE;
        end
        else if (i_pause) begin
            state_w = S_PAUSE;
        end
        else if(i_fast) begin
            state_w = S_START;
            sram_addr_w = sram_addr_r + speed;
            dac_data_w = i_sram_data;
        end
        else if(i_slow_0) begin
            /*
                for piecewise constant interpolation,
                use a counter to count the time to hold the data
                and return when the count is over.
                a register is used to store the holded value.
            */
            state_w = S_START; // state_w = i_daclrck? S_WAIT : S_WAIT_L;
            if(counter_r < speed -1) begin // i_speed is actually i_speed+1, given by the three input
                dac_data_w = tmp1_r;
                counter_w = counter_r + 1;
            end
            else begin
                tmp1_w = i_sram_data;
                sram_addr_w = sram_addr_r + 1;
                dac_data_w = tmp1_r;
            end
        end
        else if(i_slow_1) begin
            /*
                for linear interpolation,
                use a counter to count the time and propagate output value
                and return when the count is over.
            */
            state_w = S_START;// state_w = i_daclrck? S_WAIT : S_WAIT_L;
            if(counter_r < speed-1) begin
                dac_data_w = (tmp1_r*(counter_r) + tmp2_r*(speed-counter_r))/(speed);
                counter_w = counter_r + 1;
            end
            else begin
                tmp1_w = i_sram_data;
                tmp2_w = tmp1_r; // tmp2 is the past two datas retrieved
                sram_addr_w = sram_addr_r + 1;
                dac_data_w = (tmp1_r*(counter_r) + tmp2_r*(speed-counter_r))/(speed);
            end
        end
        else begin
            //nothing is indicated... play as normal
            state_w = S_START;
            sram_addr_w = sram_addr_r + 1;
            dac_data_w = i_sram_data;
        end
    end
    S_PAUSE: begin
        dac_data_w = 0;
        if(i_start) begin
            state_w = S_START;
        end
        else begin
            state_w = S_PAUSE;
        end
        if(i_stop) begin
            state_w = S_IDLE;
        end
    end
    endcase
end

always_ff @(negedge i_clk or negedge i_rst_n) begin
	if (!i_rst_n) begin
        state_r <= S_IDLE;
	end
	else begin
		state_r <= state_w;
    end
end

always_ff @(posedge i_daclrck or negedge i_rst_n) begin
	if (!i_rst_n) begin
        dac_data_r <= 0;
        sram_addr_r <= 0;
        counter_r <= 0;
        tmp1_r <= 0;
        tmp2_r <= 0;    
	end
	else begin
        tmp1_r <= tmp1_w;
        tmp2_r <= tmp2_w;
        dac_data_r <= dac_data_w;
        sram_addr_r <= sram_addr_w;
        counter_r <= counter_w;
	end
end
endmodule