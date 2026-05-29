# Traffic Light Controller using FSM

## Overview

This project implements a Finite State Machine (FSM) based Traffic Light Controller using Verilog HDL. The system controls traffic signals for two roads with sequential state transitions and timing-based signal control.

## Features

* Moore FSM Architecture
* Verilog HDL RTL Design
* Clock Divider Integration
* Traffic Signal Timing Control
* Basys 3 FPGA Support
* Behavioral Simulation
* Testbench Verification

## FSM State Flow

```text id="5xwjlwm"
S0 → S1 → S2 → S3 → S0
```

| State | Road A | Road B |
| ----- | ------ | ------ |
| S0    | Green  | Red    |
| S1    | Yellow | Red    |
| S2    | Red    | Green  |
| S3    | Red    | Yellow |

## Project Structure

```text id="mjlwm8"
Traffic-Light-Controller-FSM/
│
├── rtl/
│   ├── traffic_light_controller.v
│   └── clock_divider.v
│
├── tb/
│   └── traffic_light_tb.v
│
├── constraints/
│   └── basys3.xdc
│
├── waveform/
│
├── docs/
│
├── visualization/
│
└── README.md
```

## Tools Used

* Verilog HDL
* Xilinx Vivado
* Basys 3 FPGA
* Vivado Simulator

## Simulation

Behavioral simulation was performed using Vivado to verify FSM transitions and output timing behavior.

## Future Enhancements

* Python-based Traffic Visualization
* Real-time FPGA Hardware Implementation
* Pedestrian Crossing System
* Smart Traffic Density Detection
* Emergency Vehicle Priority Control

## Contributors

* Sriya Adimulam — RTL Design & FPGA Implementation
* Lakshmi Omkareswar Thummagunta — Verification, Visualization & Documentation
