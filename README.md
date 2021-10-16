# DSP FIR Filter

The project implemented a digital signal processor. Particularly a finite input
response filter.

## Run

This project can be run and tested by Icarus Verilog compiler.

```bash
# Compile
$ iverilog -o [executive_name] [testbench]

# Execute
$ vvp [executive_name]

# View waveform
# The filename is defined in the testbench .v file
$ gtkwave [.vcd file name]
```

---

ECE 539 2021 Fall Project

Author: Chung-Hsuan Tung, Yujie Zhang, Yi-Chen Chang
