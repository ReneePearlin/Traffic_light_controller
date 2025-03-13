module traffic_light_controller (
    input logic clk,
    input logic reset,
    output logic [2:0] lights  // 3-bit output: RED, YELLOW, GREEN
);

    // State Encoding
    typedef enum logic [1:0] {
        RED = 2'b00,
        GREEN = 2'b01,
        YELLOW = 2'b10
    } state_t;

    state_t current_state, next_state;

    // Counter for timing each state
    logic [3:0] counter;  // 4-bit counter for timing

    // State Register
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= RED;
            counter <= 0;
        end else if (counter == 9) begin  // 9 cycles per state
            current_state <= next_state;
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end

    // Next State Logic
    always_comb begin
        case (current_state)
            RED:    next_state = GREEN;
            GREEN:  next_state = YELLOW;
            YELLOW: next_state = RED;
            default: next_state = RED;
        endcase
    end

    // Output Logic (3-bit signal: RED, YELLOW, GREEN)
    always_comb begin
        case (current_state)
            RED:    lights = 3'b100;  // RED ON
            GREEN:  lights = 3'b001;  // GREEN ON
            YELLOW: lights = 3'b010;  // YELLOW ON
            default: lights = 3'b100; // Default to RED
        endcase
    end

endmodule
