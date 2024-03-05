# Asynchronous Active Low Reset FIFO Memory Controller

This repository contains the Verilog implementation of an asynchronous active low reset FIFO memory controller designed for a data processing system. The FIFO memory controller manages read and write operations, handles data overflow and underflow conditions, and ensures proper data integrity. 

## Requirements

- The FIFO memory has a depth of 8 memory locations, each capable of storing 8-bit data.
- Separate read and write ports are provided.
- Support for simultaneous read and write operations.
- Data should be read in the order it was written.
- Reading from an empty FIFO should block until data is available.
- Writing to a full FIFO should block until space becomes available.
- Implementation of status signals indicating when the FIFO is empty and when it is full.
- Full parameterization with address size and data size.

## Design Overview

The FIFO memory controller is implemented in Verilog and consists of the following modules:

1. **FIFO Memory:** This module implements the FIFO memory with a depth of 8 memory locations, each capable of storing 8-bit data.

2. **Read Controller:** Manages read operations from the FIFO memory. It ensures data is read in the correct order and handles empty FIFO conditions.

3. **Write Controller:** Manages write operations to the FIFO memory. It ensures data is written in the correct order and handles full FIFO conditions.

4. **Status Signals:** Generates status signals indicating whether the FIFO is empty or full.

## Simulation

The provided Makefile can be used to compile and simulate the Verilog design using ModelSim. To simulate the design, follow these steps:

1. Ensure ModelSim is installed on your system.
2. Clone this repository to your local machine.
3. Navigate to the repository directory.
4. Run `make compile` in the terminal to compile the Verilog design.
5. Run `make sim` to start the simulation.
6. View simulation results in the ModelSim graphical interface.

## Parameters

The Verilog code is fully parameterized with the following parameters:

- Address Size: Determines the size of the address used for accessing memory locations.
- Data Size: Determines the size of the data stored in each memory location.

## Files

- `FIFO_Memory.v`: Verilog module implementing the FIFO memory.
- `Read_Buffer.v`: Verilog module implementing the read controller.
- `Write_Buffer.v`: Verilog module implementing the write controller.
- `FIFO_Status.v`: Verilog module generating status signals.
- `tb_FIFO_Memory.v`: Testbench module for the FIFO memory controller.
- `Makefile`: Makefile for compiling and simulating the Verilog design.

## Acknowledgments

- Inspired by the need for a robust FIFO memory controller for data processing systems.
- Special thanks to the contributors and maintainers of ModelSim for their excellent simulation tool.
