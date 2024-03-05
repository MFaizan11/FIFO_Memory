sim: compile
	vsim work.tb_FIFO_Memory

compile:
	vlog ./tb_FIFO_Memory.v ./FIFO_Memory.v ./Memory.v ./Read_Buffer.v ./Write_Buffer.v ./FIFO_Status.v

.PHONY: clean
clean:
	rm -rf work vsim.wlf transcript
