module clk_div10 (
    input clk,           // Input clock
    input rst,           // Synchronous reset
    output reg clk_out   // Divided clock output
);
    reg [3:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;
            clk_out <= 0;
        end else begin
            if (count == 4'd4) begin
                clk_out <= ~clk_out; // Toggle output every 5 cycles (10 total for full toggle)
                count <= 0;
            end else
                count <= count + 1;
        end
    end
endmodule
// Code your testbench here
// or browse Examples`timescale 1ns/1ps

module tb_clk_div10;

    reg clk;
    reg rst;
    wire clk_out;

    // Instantiate the divider module
    clk_div10 uut (
        .clk(clk),
        .rst(rst),
        .clk_out(clk_out)
    );

    // Clock generation: 10ns period => 100 MHz
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reset and simulation control
    initial begin
        rst = 1;
        #20 rst = 0;

        // Run simulation for 200ns
        #200 $finish;
    end

    // Monitor the clock output
    initial begin
      $dumpfile("dump.vcd");
       $dumpvars(1);
        $display("Time\tclk\tclk_out");
        $monitor("%0t\t%b\t%b", $time, clk, clk_out);
    end

endmodule


