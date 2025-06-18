module top;
  reg [2:0] a,b;
  reg y;
  
  initial
    begin
         $dumpfile("dump.vcd");
    $dumpvars(1);
      a=3'd5;b=3'b111;
      y=a&&b;
    end
  initial begin
    $monitor("y=%b",y);
    #100;
  end
endmodule

ans y=1


module top;
  reg [2:0] a,b;
  reg [2:0]y;
  
  initial
    begin
         $dumpfile("dump.vcd");
    $dumpvars(1);
      a=3'd5;b=3'b111;
      y=a|b;
    end
  initial begin
    $monitor("y=%b",y);
    #100;
  end
endmodule

y=111
module top;
  reg [2:0] a,b;
  reg [2:0]y;
  reg z;
  
  initial
    begin
         $dumpfile("dump.vcd");
       $dumpvars(1);
      a=3'd5;
      y=^ a;
    end
  initial begin
    $monitor("z=%b",y);
    #100;
  end
endmodule

y=000

module top;
  reg [2:0] a,b;
  reg [2:0]y;
  reg z;
  
  initial
    begin
         $dumpfile("dump.vcd");
       $dumpvars(1);
      a=3'd5;
      y=a>>1;;
    end
  initial begin
    $monitor("y=%b",y);
    #100;
  end
endmodule

y=010
