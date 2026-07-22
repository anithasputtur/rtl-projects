# TRAFFIC_LIGHT CONTROLLER

This is where I keep the RTL projects I build while learning VLSI and digital design.

I'm Anitha, a 2nd year ECE student at VCET Puttur. My focus is RTL design using Verilog, and I'm working toward a career in VLSI. I learn by doing understanding a concept, applying it, improving it, and repeating that cycle.

---

## What's here

### Traffic Light Controller FSM
`controller.v` — the main design  
`testbench.v` — the testbench

A traffic light controller built as a Moore FSM in Verilog. It cycles through RED, GREEN, and YELLOW using a counter to control how long each state lasts. There's also an emergency override when triggered, it immediately forces GREEN no matter which state the FSM is currently in.

State encoding used:
- RED = 00
- GREEN = 10  
- YELLOW = 01

Priority order inside the design: reset first, emergency second, normal cycle last.

To run it with iverilog:
```
iverilog -o traffic controller.v testbench.v
vvp traffic
```

Simulated and verified in ModelSim. The waveform confirms all state transitions and the emergency override work correctly.

Tools used: VS Code, iverilog, ModelSim
