/*
101 Non-Overlapping Moore Sequence Detector
Step 1 - Parameter Definition
Step 2 - Declaring State Variable
Step 3 - Two Process Implementation Of Moore Model which has the following steps: 
      - Reset Logic and Present State Decoder
      - Next State Decoder
      - Output Logic
*/

module sequencedetector (
  input x,
  input clk,
  input rst,
  output reg z
);

  parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3;
  reg [1:0] PS, NS;

  always @(posedge clk or posedge rst)
    if (rst)
      PS <= s0;
    else
      PS <= NS;

  always @(PS, x)
    case (PS)
      s0: begin
        z = 0;
        NS = (x) ? s1 : s0;
      end
      s1: begin
        z = 0;
        NS = (x) ? s1 : s2;
      end
      s2: begin
        z = 0;
        NS = (x) ? s3 : s0;
      end
      s3: begin
        z = 1;
        NS = (x) ? s1 : s0;
      end
      default: NS <= s0;
    endcase

endmodule

