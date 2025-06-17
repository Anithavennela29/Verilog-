// Code your design here
module mod6_ripple_counter (
    input clk,
    input rst_n,
    output reg [2:0] q
);
    always @(negedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 3'b000;
        else if (q == 3'b101)
            q <= 3'b000;
        else
            q <= q + 1;
    end
endmodule
// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module tb_mod6_ripple_counter;

    reg clk;
    reg rst_n;
    wire [2:0] q;

    mod6_ripple_counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .q(q)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

  task apply_reset;
        begin
            $display("Applying reset...");
          
            rst_n = 0;
             // Hold reset for a few cycles
           @(negedge clk);
            rst_n = 1;
            $display("Reset released.");
        end
    endtask
    

    // Test sequence
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
      apply_reset(); // Run for 12 cycles
      #100;
        $finish;
    end

endmodule
