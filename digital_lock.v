module digital_lock (
    input clk,
    input reset,
    input [3:0] digit_in,      // 4-bit input for each digit (0-9)
    input load,                // Load signal to enter each digit
    output reg unlocked
);
    // Password: 4, 3, 2, 1
    parameter D1 = 4'd4;
    parameter D2 = 4'd3;
    parameter D3 = 4'd2;
    parameter D4 = 4'd1;

    reg [2:0] state;
    parameter IDLE=0, S1=1, S2=2, S3=3, S4=4, UNLOCK=5, FAIL=6;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            unlocked <= 0;
        end else if (load) begin
            case (state)
                IDLE: begin
                    if (digit_in == D1) state <= S1;
                    else state <= FAIL;
                end
                S1: begin
                    if (digit_in == D2) state <= S2;
                    else state <= FAIL;
                end
                S2: begin
                    if (digit_in == D3) state <= S3;
                    else state <= FAIL;
                end
                S3: begin
                    if (digit_in == D4) state <= UNLOCK;
                    else state <= FAIL;
                end
                UNLOCK: begin
                    unlocked <= 1; // Stay unlocked
                end
                FAIL: begin
                    state <= IDLE;
                    unlocked <= 0;
                end
            endcase
        end
    end
endmodule
