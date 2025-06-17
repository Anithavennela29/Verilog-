
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
  reg [15:0]y;
  integer b;
  initial begin
    y = -(12/3);
    
    $monitor("y=%d",y);
  end
endmodule

y=65532

exp:2^16-4=65532
