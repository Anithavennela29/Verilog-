module test();
  integer x;
  
  initial
    begin 
    #1  x = #2 10;    // After 1, schedule RHS delay 2 → x = 10 at t = 3
    x <= #1 20;       // Schedule x = 20 at t = 2 (non-blocking)
    #3  x = 30;       // After 3 → t = 4, x = 30
    #1  x <= #2 40;   // Schedule x = 40 at t = 7
    #2  x = #2 50;  
  end
  initial
    begin
      $dumpfile("dump.vcd");
    $dumpvars(1);
      $monitor("Time = %0t : x = %0d", $time, x);
      #100;
  end
endmodule

Time = 0 : x = x
Time = 3 : x = 10
Time = 4 : x = 20
Time = 6 : x = 30
Time = 9 : x = 40
Time = 11 : x = 50



initial
    begin 
    x = #1 5;     // Blocking, value assigned at t=1
    x <= #1 10;   // Non-blocking, scheduled at t=2
    #2;
    x = #2 20;    // Blocking again, executes at t=4, value assigned at t=6
    x <= #1 30;   // Scheduled at t=5 to update at t=6
    #2;  
  end

Time = 0 : x = x
Time = 1 : x = 5
Time = 2 : x = 10
Time = 5 : x = 20
Time = 6 : x = 30

//at t=1 blocking so after completing that nonblocking scheduled at t=1 and blocking scheduled at t=3.afte t=3+2 =5 x=20.
blocking blocks the next statment whereas (nonbl  next blocking)starts at same time.


  initial begin
    a <= #2 5;
    $display("Time %0t: a=%0d", $time, a);
    #3 $display("Time %0t: a=%0d", $time, a);
  
  end

Time 0: a=0
VCD info: dumpfile dump.vcd opened for output.
VCD warning: $dumpvars: Package ($unit) is not dumpable with VCD.
Time 3: a=5

//4question
  reg [7:0] a = 0, b = 1, c = 2;

  initial begin
    a <= #1 b;     // non-blocking
    b = #2 c;      // blocking with delay
    c <= #1 a;     // non-blocking
    #3;
    
  end
  initial
    begin
      $dumpfile("dump.vcd");
    $dumpvars(1);
      $monitor("a=%0d b=%0d c=%0d %t", a, b, c,$time);
      #100;

a=0 b=1 c=2                    0
a=1 b=1 c=2                    1
a=1 b=2 c=2                    2
a=1 b=2 c=1                    3
