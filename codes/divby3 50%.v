module clk_div_3 (
    input clk,           // Input clock
    input rst,           // Synchronous reset
    output clk_out1,
      output clk_out2,
     output clk_out3// Divided clock output
);
  reg [2:0] count;
  reg count1;
  

    always @(posedge clk) begin
        if (rst)
          begin
            count <= 0;
            
        end
      else 
          
        if (count ==2) 
              
                count <= 0;
          else
                count <= count + 1;
        
    end
  
  assign clk_out1=count[0];
  
  always @(negedge clk) begin
        if (rst)
          begin
            count1<= 0;
            
        end
      else 
            count1 <= count[0];
        
    end
  assign clk_out2=count1;
  assign clk_out3=count1|count[0];
endmodule
// Code your testbench here
// or browse Examples`timescale 1ns/1ps

`timescale 1ns/1ps

module tb_clk_div_3duty;

    reg clk;
    reg rst;
    wire clk_out1;
     wire clk_out2;
  wire clk_out3;

    // Instantiate divide-by-5 with 20% duty
    clk_div_3 uut (
        .clk(clk),
        .rst(rst),
      .clk_out1(clk_out1),.clk_out2(clk_out2),.clk_out3(clk_out3)
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
     // $monitor("%0t\t%b\t%b\t%b", $time, clk, clk_out1, clk_out2);
    end

endmodule


   


