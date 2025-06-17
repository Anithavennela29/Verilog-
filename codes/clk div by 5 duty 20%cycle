module clk_div_20duty #(parameter DIVISOR = 5)(
    input wire clk,
    input wire rst,
    output reg clk_out
);

    integer count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count   <= 0;
            clk_out <= 0;
        end else begin
            if (count < DIVISOR-1)
                count <= count + 1;
            else
                count <= 0;

            if (count < (DIVISOR / 5))  // High for 1 out of 5 cycles = 20%
                clk_out <= 1;
            else
                clk_out <= 0;
        end
    end
endmodule
// Code your testbench here
// or browse Examples`timescale 1ns/1ps

`timescale 1ns/1ps

module tb_clk_div_20duty;

    reg clk;
    reg rst;
    wire clk_out;

    // Instantiate divide-by-5 with 20% duty
    clk_div_20duty #(5) uut (
        .clk(clk),
        .rst(rst),
        .clk_out(clk_out)
    );

    // Generate 100 MHz clock (10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle every 5ns => 10ns period
    end

    // Apply reset and run simulation
    initial begin
        rst = 1;
        #15 rst = 0;

        #200 $finish;
    end

    initial begin
       $dumpfile("dump.vcd");
       $dumpvars(1);
        $display("Time\tclk\tclk_out");
        $monitor("%0t\t%b\t%b", $time, clk, clk_out);
    end

endmodule


   


