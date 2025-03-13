# Traffic_light_controller
OVERVIEW:
This project implements a Traffic Light Controller using a Finite State Machine (FSM) in Verilog. The design simulates a typical traffic light system with well-defined states to control vehicle movement efficiently
The FSM controls the traffic lights through three main states:

RED: Vehicles must stop.

GREEN: Vehicles can move.

YELLOW: Vehicles should prepare to stop.

The system follows a cyclic pattern ensuring each state lasts for a fixed number of clock cycles to maintain proper timing control.

DESIGN DETAILS:
Language Used: Verilog HDL
FSM Type: Moore Machine (Output depends only on the current state)
States: RED, GREEN, YELLOW
Timing Control: Each state remains active for 10 clock cycles before transitioning to the next

STRUCTURE OF THE FILE:
traffic_light_controller.v — Main Verilog module implementing the FSM logic
tb_traffic_light_controller.v — Testbench for verifying functionality and timing
