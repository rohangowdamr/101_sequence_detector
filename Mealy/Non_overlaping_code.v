module sequencedetector(
  input x,
  input clk,
  input rst,
  output reg z
);

  // Parameter definitions
  parameter s0 = 0, s1 = 1, s2 = 2;
  
  // State variables
  reg [1:0] PS, NS;

  // State transition and output logic
  always @(posedge clk or posedge rst)
  begin
    if (rst)
      PS <= s0; // Reset state to s0 on rst
    else
      PS <= NS; // Update state based on next state
  end

  always @(PS, x)
    case (PS)
      s0: begin
        // Output logic for state s0
        z = (x) ? 0 : 0; // Set output based on input
        NS = (x) ? s1 : s0; // Transition to next state based on input
      end
      s1: begin
        // Output logic for state s1
        z = (x) ? 0 : 0;
        NS = (x) ? s1 : s2;
      end
      s2: begin
        // Output logic for state s2
        z = (x) ? 1 : 0;
        NS = (x) ? s0 : s0;
      end
      default: NS <= s0;
    endcase

endmodule
