module mux8to1_using_for (
  input  [7:0] in,       // 8 input lines
  input  [2:0] sel,      // 3-bit select line
  output reg out         // Output
);

  integer i;

  always @(*) begin
    out = 0;
    for (i = 0; i < 8; i = i + 1) begin
      if (sel == i)
        out = in[i];
    end
  end

endmodule
//mux using for loop
