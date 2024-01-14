module seq_det_test;
  reg x, clk, rst;
  wire z;

  sequencedetector d1 (.x(x), .clk(clk), .rst(rst), .z(z));

  initial begin
    clk = 0;
    rst = 1;
    x = 0;
  end

  always #5 clk = ~clk;

  initial begin
    $monitor("time=%0d", $time, " rst=%0d", rst, " PS=%0d", d1.PS, " sclk=%0d", clk, " x=%0d", x, " z=%0d", z, " NS=%0d", d1.NS);
  end

  initial begin
    #5 rst = 0;
    #10; x = 1;
    #10 x = 0;
    #10 x = 1;

    #10 x = 0;

    #10 x = 1;
    #10 x = 0;
    #10; x = 0;

    #10; x = 1;
    #10; x = 0;
    #10; x = 1;
    #10; x = 0;
    #10; x = 1;

    #10; x = 1;
    #10; x = 0;
    #10; x = 1;
    #10; x = 0;
    #10; x = 1;
 
    #10; x = 1;
    #10; x = 0;
    #10; x = 1;
    #10; rst = 1;

    #5; $finish;

  end
endmodule

