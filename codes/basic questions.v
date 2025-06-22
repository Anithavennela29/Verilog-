// Code your testbench here
// or browse Examples
// Code your design here
module fibonacci(clock,reset,value);
input clock,reset;
output [31:0]value;
reg [31:0]previous,current;
  always@(posedge clock or posedge reset)
begin
if (reset)
begin
previous <= 32'd0;
current <=32'd1;
end
else
begin
current <= current + previous;
previous <= current;
end
end
assign value=previous;
endmodule

module fibtb();
reg clock, reset;
wire [31:0]value;
fibonacci f1(clock, reset, value);
initial
begin
reset=1;
#10 reset=0;
end
initial
begin
   // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
clock=0;
forever
#10 clock=~clock;
end
initial
begin
#500 $finish;
end
endmodule






module clk_divider(clk_40_40,clk_20_20,clk_20_40, src_clk,
reset);
input src_clk, reset;
output clk_40_40,clk_20_20,clk_20_40;
reg[2:0]count_posedge;
reg a1,a2,a3;
always@(posedge src_clk)
begin
if(reset)
count_posedge <= 0;
else
begin
if(count_posedge == 4)
count_posedge <= 0;
else
count_posedge <= count_posedge + 1;
end
end
always@(posedge src_clk)
begin
if(count_posedge == 0)
a1 <= 1;
else
a1 <= 0;
end
always@(negedge src_clk)
begin
if(count_posedge == 3)
a2 <= 1;
else
a2 <= 0;
end

always@(posedge src_clk)
begin
if(count_posedge == 0 ||count_posedge == 1)
a3 <= 1;
else
a3 <= 0;
end
assign clk_40_40 = a1 | a2;
assign clk_20_20 = a1;
assign clk_20_40 = a3;
endmodule

// Code your testbench here
// or browse Examples

`timescale 1ns/1ns
module test;
reg src_clk, reset;
wire clk_40_40,clk_20_20,clk_20_40;
clk_divider DUT(clk_40_40,clk_20_20,clk_20_40, src_clk,
reset);
initial
begin
src_clk = 0;
forever
#5 src_clk = ~src_clk;
end
task rsr_dut;
begin
@(negedge src_clk)
reset = 1;
@(negedge src_clk)
reset = 0;
end
endtask
initial
begin
  $dumpfile("dump.vcd");
    $dumpvars(1);
rsr_dut;
#200 $finish;
end
endmodule
