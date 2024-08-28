# Compiler and simulator
VC = iverilog
SIM = vvp

# .v files
DUT = behavioral_parkingController.v 
TESTER = tester.v
TB = testbench.v 

# Executable
OUTPUT = sim.out

# Default rule
all: $(OUTPUT)

# Compile and link
$(OUTPUT): $(DUT) $(TESTER) $(TB)
	$(VC) -o $(OUTPUT) $(DUT) $(TESTER) $(TB)

# Run sim
run: $(OUTPUT)
	$(SIM) $(OUTPUT)

# Clean binaries
clean:
	rm -f $(OUTPUT)

# Phony targets
.PHONY: all run clean
