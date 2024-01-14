/*
101 Overlapping Mealy Sequence Detector
Step 1 - Parameter Definition
Step 2 - Declaring State Variable
Step 3 - One Process Implementation Of Mealy Model which has the following steps:
      - Reset Logic
      - Next State Decoder
      - Output Logic
*/


module sequencedetector(
  input x,
  input clk,
  input rst,
  output reg z
);

parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10;

reg [1:0] state = s0;

always @(posedge clk) begin
  if (rst) begin
    state <= s0;
    z <= 0;
  end 
  else begin
    case (state)
      s0: begin
        if (x) begin
          state <= s1;
          z <= 0;
        end
        else begin
          state <= s0;
          z <= 0;
        end
      end
      s1: begin
        if (x) begin
          state <= s1;
          z <= 0;
        end
        else begin
          state <= s2;
          z <= 0;
        end
      end
      s2: begin
        if (x) begin
          state <= s1;
          z <= 1;
        end
        else begin
          state <= s0;
          z <= 0;
        end
      end
      default: state <= s0;
    endcase
  end
end

endmodule

