module sequencedetector(
  input x,
  input clk,
  input rst,
  output reg z
);
  // Parameter definitions
  parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3;

  // State variables
  reg [1:0] PS, NS;

  // State transition and output logic
  always @(posedge clk or posedge rst)
    if (rst)
      PS <= s0; // Reset state to s0 on rst
    else
      PS <= NS; // Update state based on next state

  always @(PS, x)
    case (PS)
      s0: begin
        // Output logic for state s0
        z = 0;
        NS = (x) ? s1 : s0; // Transition to next state based on input
      end
      s1: begin
        // Output logic for state s1
        z = 0;
        NS = (x) ? s1 : s2;
      end
      s2: begin
        // Output logic for state s2
        z = 0;
        NS = (x) ? s3 : s0;
      end
      s3: begin
        // Output logic for state s3
        z = 1;
        NS = (x) ? s1 : s0;
      end
      default: NS <= s0;
    endcase
endmodule
