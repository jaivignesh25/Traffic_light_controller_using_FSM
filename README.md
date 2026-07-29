**Traffic Light Controller Using Verilog FSM**

A 4-Way Traffic Light Controller designed using **Verilog HDL** based on the **Finite State Machine (FSM)** concept. The controller manages traffic signal sequencing for four directions and includes an Emergency Vehicle Priority Mode, where all roads turn RED except the emergency route, which receives a GREEN signal.

**Features**

- Four-way traffic signal controller
- Finite State Machine (FSM) implementation
- Timer-based signal transitions
- Emergency Vehicle Priority Mode
- Modular RTL Design
- Behavioral Simulation using AMD Xilinx Vivado
- Verilog Testbench for Functional Verification

**Tools & Technologies**
- Verilog HDL
- AMD Xilinx Vivado (2025.2 or later)
- XSim Simulator
- Finite State Machine (FSM)
- RTL Design

**Project Structure**

Traffic-Light-Controller-Using-FSM
│
├── traffic_controller.v      # RTL Design
├── traffic_tb.v              # Testbench
├── README.md
├── images/
│   ├── architecture.png
│   ├── flowchart.png
│   ├── state_diagram.png
│   └── waveform.png
└── report/
    └── Project_Report.pdf

**How the Controller Works**
The controller cycles through the following sequence:

North Green
      ↓
North Yellow
      ↓
East Green
      ↓
East Yellow
      ↓
South Green
      ↓
South Yellow
      ↓
West Green
      ↓
West Yellow
      ↓
Repeat

**Emergency Mode**
When the **Emergency** input is HIGH:

- North → RED
- East → RED
- South → RED
- West → GREEN

After the emergency signal is cleared, the controller resumes its normal FSM sequence.

**How to Run the Project in AMD Xilinx Vivado**

**Step 1** – Launch Vivado
Open **AMD Xilinx Vivado**.
Select:
Create Project

**Step 2** – Create a New Project
 Enter the project name.

Example:
Traffic_Light_Controller
Click **Next**.

**Step 3** – Project Type
Choose
RTL Project

✔ Do **NOT** select
Do not specify sources at this time
Click **Next**.

**Step 4** – Add Design Sources
Click
Add Files
Select
traffic_controller.v
Click **Finish**.

**Step 5** – Add Simulation Sources
Click
Add Sources
→ Add or Create Simulation Sources
Add
traffic_tb.v
Finish the wizard.

**Step 6** – Select FPGA Device
Choose your FPGA board or device.
If you only want simulation, any supported FPGA device is acceptable.
Click Finish.

**Step 7** – Verify the Project

The Sources window should show:
Design Sources
    traffic_controller.v
Simulation Sources
    traffic_tb.v
    
**Step 8** – Run Behavioral Simulation
From the Flow Navigator:

Simulation
    ↓
Run Behavioral Simulation

Vivado will compile the RTL and launch the XSim simulator.

**Step 9** – Observe the Waveforms

Verify:

- Clock generation
- Reset operation
- FSM state transitions
- Green → Yellow → Red sequence
- Emergency mode operation
  
**Step 10** – Test Emergency Mode
The testbench automatically asserts:
emergency = 1
Expected output:
North = RED
East  = RED
South = RED
West  = GREEN

After the emergency signal becomes LOW, the controller resumes normal operation.

**Expected Simulation**

The waveform should show:

- Reset initialization
- North Green → Yellow
- East Green → Yellow
- South Green → Yellow
- West Green → Yellow
- Continuous looping
- Emergency override
- Resume normal traffic sequence

 **Learning Outcomes**

This project demonstrates:

- Finite State Machine (FSM) Design
- Verilog HDL Programming
- RTL Design Methodology
- Digital Logic Design
- Functional Verification
- Behavioral Simulation
- AMD Xilinx Vivado Workflow

**Future Enhancements**

- Vehicle Density Detection
- AI-Based Adaptive Traffic Control
- Pedestrian Crossing System
- Seven Segment Countdown Timer
- FPGA Hardware Implementation
- IoT-Based Smart Traffic Monitoring

**Author**

**Jaivignesh M**
B.E. Electronics and Communication Engineering

Interested in:

- VLSI Design
- RTL Design
- Digital Design
- FPGA
- Functional Verification

---

## 📄 License

This project is intended for educational and learning purposes.
