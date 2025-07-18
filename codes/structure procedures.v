`timescale 1ns/1ps

module siso_right_shift (
  input wire clk,
  input wire rst_n,      // Active-low reset
  input wire serial_in,  // Serial input
  output reg serial_out  // Serial output (LSB)
);

  // Internal 3-bit shift register storage
  reg bit2, bit1, bit0;

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      bit2 <= 0;
      bit1 <= 0;
      bit0 <= 0;
      serial_out <= 0;
    end else begin
      // Shift right using non-blocking assignments (no operators)
      bit0 <= serial_in;
      bit1 <= bit0;
      bit2 <= bit1;
      serial_out <= bit2;  // Output the LSB
    end
  end

endmodule
`timescale 1ns/1ps

module tb_siso_right_shift;

  // Testbench signals
  reg clk;
  reg rst_n;
  reg serial_in;
  wire serial_out;

  // Instantiate the DUT
  siso_right_shift uut (
    .clk(clk),
    .rst_n(rst_n),
    .serial_in(serial_in),
    .serial_out(serial_out)
  );

  // Clock generation: 10ns period
  always #5 clk = ~clk;

  initial begin
    // Initial values
    clk = 0;
    rst_n = 0;
    serial_in = 0;

    // Reset pulse
    #10 rst_n = 1;

    // Apply serial input sequence: 1, 0, 1, 1
    #10 serial_in = 1;
    #10 serial_in = 0;
    #10 serial_in = 1;
    #10 serial_in = 1;
    #10 serial_in = 0;

    // End simulation
    #20 $finish;
  end

  // Monitor output
   // Monitor output
  initial begin
    $display("Time\trst_n\tserial_in\tserial_out");
    $monitor("%0t\t%b\t%b\t\t%b", $time,rst_n, serial_in, serial_out);
  end
endmodule
# Time  rst_n   serial_in       serial_out
# 0     0       0               0
# 10000 1       0               0
# 20000 1       1               0
# 30000 1       0               0
# 40000 1       1               0
# 55000 1       1               1
# 60000 1       0               1
# 65000 1       0               0
# 75000 1       0               1

module casex_example;

  reg [2:0] c;
  reg [1:0] state;

  // State encoding (for clarity)
  parameter st1 = 2'b00,
            st2 = 2'b01,
            st3 = 2'b10;

  initial begin
    c = 3'b00x;  // You can set it to 3'b00x if the simulator supports x
  end

  always @(*) begin
    casex (c)
      3'b000 : state = st1;
      3'b1xx : state = st2;  // matches any value with MSB=1
      3'b001 : state = st3;
      default: state = 2'b11;
    endcase
  end

  initial begin
    $monitor("Time = %0t | c = %b | state = %b", $time, c, state);
    #10 c = 3'b000;
    #10 c = 3'b10x;
    #10 c = 3'b001;
    #10 c = 3'b111;
    #10 $finish;
  end

endmodule
# Time = 0 | c = 00x | state = 00
# Time = 10 | c = 000 | state = 00
# Time = 20 | c = 10x | state = 01
# Time = 30 | c = 001 | state = 10
# Time = 40 | c = 111 | state = 01

module d_latch_using_mux (
  input wire D,       // Data input
  input wire EN,      // Enable (acts like a clock for latch)
  output reg Q        // Output
);

  always @(*) begin
    case (EN)
      1'b0: Q = Q;     // Latch holds its value (Q stays the same)
      1'b1: Q = D;     // When enabled, Q gets D
    endcase
  end

endmodule
