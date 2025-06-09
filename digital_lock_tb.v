`timescale 1ns/1ps
module digital_lock_tb;

    reg clk, reset, load;
    reg [3:0] digit_in;
    wire unlocked;

    digital_lock uut (
        .clk(clk),
        .reset(reset),
        .digit_in(digit_in),
        .load(load),
        .unlocked(unlocked)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $display("Start Digital Lock Test");
        clk = 0; reset = 1; load = 0; digit_in = 0;

        #10 reset = 0;

        // Enter correct password: 4 3 2 1
        enter_digit(4);
        enter_digit(3);
        enter_digit(2);
        enter_digit(1);

        #20;
        $display("Unlocked = %b (Expected: 1)", unlocked);

        // Reset and try wrong password
        reset = 1; #10; reset = 0;

        enter_digit(1);
        enter_digit(2);
        enter_digit(3);
        enter_digit(4);

        #20;
        $display("Unlocked = %b (Expected: 0)", unlocked);

        $finish;
    end

    task enter_digit;
        input [3:0] val;
        begin
            digit_in = val;
            load = 1;
            #10;
            load = 0;
            #10;
        end
    endtask
endmodule
