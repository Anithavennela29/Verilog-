
module intra_delay_example;
  reg [5:0]y;
  integer b;
  initial begin
    b = -'d12/3;
    
    $monitor("b=%d",b);
  end
endmodule

b= 1431655761

exp:2^32-12=1431655761

module intra_delay_example;
  reg [5:0]y;
  integer b;
  initial begin
    b = -12/3;
    
    $monitor("b=%d",b);
  end
endmodule
b=         -4



module intra_delay_example;
  reg [13*8:1]s;
  integer b;
  initial begin
   s="Maven silicon";
    
    $display("Value=%s",s[104:65]);
  end
endmodule
Value=Maven


module test;
  parameter WIDTH=8;
endmodule

module top;
  test DUT();
  initial 
    defparam DUT.WIDTH = 10;
endmodule
The parameter WIDTH will be changed before simulation starts, during elaboration.

defparam should not be used in synthesizable RTL.

✅ Recommended Method: Parameterized Instantiation
This is the preferred and modern way:


module test #(parameter WIDTH=8);
endmodule

module top;
  test #(.WIDTH(10)) DUT();  // Override WIDTH during instantiation
endmodule



module intra_delay_example;
  reg [15:0]y;
  integer b;
  initial begin
    y = -(12/3);
    
    $monitor("y=%d",y);
  end
endmodule

y=65532

exp:2^16-4=65532
