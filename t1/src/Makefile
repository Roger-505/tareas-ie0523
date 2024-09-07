# Compiler, simulator, and waveform viewer
VC    = iverilog
SIM   = vvp
WAVEV = gtkwave

# .v files
DUT    = behavioral_parkingController.v 
TESTER = tester.v
TB     = testbench.v 

# Binaries
OUTPUT   	= sim.out
WAVEFORM 	= sim.vcd
WAVE_CFG 	= waves.gtkw

# Default rule
all: $(OUTPUT)

# Compile and link
$(OUTPUT): $(DUT) $(TESTER) $(TB)
	$(VC) -o $(OUTPUT) $(DUT) $(TESTER) $(TB)

# Run sim
$(WAVEFORM): $(OUTPUT)
	$(SIM) $(OUTPUT)

run: $(WAVEFORM)

wave: $(WAVEFORM)
	$(WAVEV) $(WAVEFORM) --save $(WAVE_CFG)&

# Clean binaries
clean:
	@rm -f $(OUTPUT) $(WAVEFORM) 

# Phony targets
.PHONY: all run clean
