# Compiler, simulator, waveform viewer, and synthesis tool
VC    = @iverilog
SIM   = @vvp
WAVEV = @gtkwave
SYNTH = @yosys

# .v files
DUT     = ./hdl/behavioral_parkingController.v 
TESTER  = ./sim/tester.v
TB      = ./sim/testbench.v 
INC     = ./include
WAVEFORM= sim.vcd

# Binaries
OUTPUT_RTLIL  	= sim_rtlil.out
OUTPUT_CMOS   	= sim_cmos.out
WAVEFORM_RTLIL 	= sim_rtlil.vcd
WAVEFORM_CMOS  	= sim_cmos.vcd
WAVE_CFG      	= ./sim/waves.gtkw

# Synthesis with RTLIL files
SYNTH_SCRPT_RTLIL   = ./synth/rtlil_synth.ys
SYNTH_DUT_RTLIL     = ./synth/rtlil_synth_parkingController.v

# Synthesis with cmos_cells.lib files 
SYNTH_SCRPT_CMOS    = ./synth/cmos_synth.ys
SYNTH_DUT_CMOS      = ./synth/cmos_synth_parkingController.v
CMOS_V              = ./synth/cmos_cells.v

# Default rule
all: synth_rtlil synth_cmos

# Synthesize with RTLIL
$(OUTPUT_RTLIL): $(DUT)
	$(SYNTH) -s $(SYNTH_SCRPT_RTLIL)
	$(VC) -I$(INC) -o $(OUTPUT_RTLIL) $(SYNTH_DUT_RTLIL) $(TESTER) $(TB)

# Synthesize with CMOS cells
$(OUTPUT_CMOS): $(DUT)
	$(SYNTH) -s $(SYNTH_SCRPT_CMOS)
	$(VC) -I$(INC) -o $(OUTPUT_CMOS) $(SYNTH_DUT_CMOS) $(CMOS_V) $(TESTER) $(TB)

# Run simulations
run: $(OUTPUT_RTLIL) $(OUTPUT_CMOS)
	$(SIM) $(OUTPUT_RTLIL)
	@mv $(WAVEFORM) $(WAVEFORM_RTLIL)
	$(SIM) $(OUTPUT_CMOS)
	@mv $(WAVEFORM) $(WAVEFORM_CMOS)

# Waveform generation
wave: run
	$(WAVEV) $(WAVEFORM_RTLIL) --save $(WAVE_CFG)
	$(WAVEV) $(WAVEFORM_CMOS) --save $(WAVE_CFG)

# Clean binaries
clean:
	@rm -f $(OUTPUT_RTLIL) $(OUTPUT_CMOS) $(WAVEFORM_RTLIL) $(WAVEFORM_CMOS) $(WAVEFORM) $(SYNTH_DUT_CMOS) $(SYNTH_DUT_RTLIL)
	
# Phony targets
.PHONY: all clean wave run synth_rtlil synth_cmos

