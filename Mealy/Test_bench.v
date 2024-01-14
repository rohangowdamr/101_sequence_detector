`timescale 1ns / 1ps

module tb_sequencedetector;

  reg x;
  reg clk;
  reg rst;
  wire z;

  sequencedetector uut (
    .x(x),
    .clk(clk),
    .rst(rst),
    .z(z)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $monitor("Time=%0t, state=%b, x=%b, z=%b", $time, uut.state, x, z);

    rst = 1;
    x = 1;
    #10 rst = 0;

    #10 x = 0;
    #10 x = 1;
    #10 x = 1;

    #10 x = 1;
    #10 x = 0;
    #10 x = 1;

    #10 x = 1;
    #10 x = 1;
    #10 x = 0;

    #10 x = 1;
    #10 x = 0;
    #10 x = 1;

    #10 x = 0;
    #10 x = 1;
    #10 x = 0;

    #50 $finish;
  end

  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end

endmodule

