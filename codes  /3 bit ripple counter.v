// Code your design here
module ripple_down_counter (
    input clk,
    input rst_n,
    output reg [2:0] q
);

    always @(negedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 3'b111;  // Start from max (down counter)
        else
            q <= q - 1;   // Decrement on each negative edge
    end

endmodule
// Code your testbench here
// or browse Examples

`timescale 1ns / 1ps

module tb_ripple_down_counter;

    reg clk;
    reg rst_n;
    wire [2:0] q;

    // Instantiate the counter
    ripple_down_counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .q(q)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
       $dumpfile("dump.vcd");
    $dumpvars(1);
        $display("Time\tReset\tQ");
        $monitor("%0t\t%b\t%b", $time, rst_n, q);

        rst_n = 0;
        #12;         // Apply reset
        rst_n = 1;   // Release reset

        #100;        // Run counter for some time

        $finish;
    end

endmodule
