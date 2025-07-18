module top;
reg[1:0]a;
initial
begin
$display($time,"a=%d",a);
a = 2'd3;
#10;
a = 2'd2;
end
endmodule
ans:0,a=x

module top;
reg[1:0]b;
initial
begin
$strobe($time,"b=%d",b);
b = 2'd3;
b = 2'dx;
#10;
b = 2'd2;
end
endmodule

  0b=x


reg[1:0]b;
initial
begin
$monitor($time,“b=%d”,b);
b = 2’d0;
b = 2’dx;
#10;
b = 2’d2;
#10;
b = 2’d1;
$monitoroff;
#10;
b = 2’d2;
$monitoron;
#10;
b = 2’d1;
                     0b=x
#                   10b=2
#                   30b=2
#                   40b=1



  `timescale 10ns/1ns
module test;

parameter real P = 15.5;
reg a;

initial begin
  $monitor($realtime, " Value of a = %b", a);
  #P a = 1'b1;
  #P a = 1'b0;
end

endmodule
0 Value of a = x
# 15.5 Value of a = 1
# 31 Value of a = 0


  
  `timescale 10ns/1ns
module test;

parameter real P = 15.5;
reg a;

initial begin
  $monitor($realtime, " Value of a = %b", a);
  #P a = 1'b1;
  #P a = 1'b0;
end

endmodule 

                     0 Value of a = x
#                   16 Value of a = 1
#                   31 Value of a = 0


  module odd_random_numbers;

  integer i = 0;
  integer count = 0;
  integer rand_num;

  initial begin
    $display("Generating 5 odd random numbers between 1 and 10:");
    
    while (count < 5) begin
      rand_num = $urandom_range(1, 10);  // generates random number between 1 and 10

      if (rand_num % 2 == 1) begin
        $display("Odd Random Number %0d: %0d", count + 1, rand_num);
        count = count + 1;
      end
    end
  end

endmodule
Generating 5 odd random numbers between 1 and 10:
# Odd Random Number 1: 3
# Odd Random Number 2: 7
# Odd Random Number 3: 9
# Odd Random Number 4: 1
# Odd Random Number 5: 1
