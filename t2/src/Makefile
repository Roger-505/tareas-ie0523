#Compiler, simulator, waveform viewer, and synthesis tool
VC    = @iverilog
SIM   = @vvp
WAVEV = @gtkwave
SYNTH = @yosys

# Behavioral .v files
DUT     	= ./hdl/behavioral_parkingController.v 
TESTER  	= ./sim/tester.v
TB      	= ./sim/testbench.v 
INC     	= ./include
WAVEFORM	= sim.vcd
WAVE_CFG	= ./sim/waves.gtkw

# Synthesis with RTLIL files
WAVEFORM_RTLIL 		= sim_rtlil.vcd
OUTPUT_RTLIL  		= sim_rtlil.out
SYNTH_SCRPT_RTLIL   = ./synth/rtlil_synth.ys
SYNTH_DUT_RTLIL     = ./synth/rtlil_synth_parkingController.v

# Synthesis with cmos_cells.lib files 
OUTPUT_CMOS   		= sim_cmos.out
SYNTH_SCRPT_CMOS    = ./synth/cmos_synth.ys
SYNTH_DUT_CMOS      = ./synth/cmos_synth_parkingController.v
WAVEFORM_CMOS  		= sim_cmos.vcd
CMOS_V              = ./synth/cmos_cells.v

# Synthesis with delay + cmos_cells.lib  files 
OUTPUT_CMOS_DELAY 		= sim_cmos_delay.out
SYNTH_SCRPT_CMOS_DELAY 	= ./synth/cmos_delay_synth.ys
SYNTH_DUT_CMOS_DELAY	= ./synth/cmos_delay_synth_parkingController.v
WAVEFORM_CMOS_DELAY 	= sim_cmos_delay.vcd
CMOS_V_DELAY			= ./synth/cmos_delay_cells.v

# Default rule
all: clean wave

# Synthesize with RTLIL
$(OUTPUT_RTLIL): $(DUT)
	$(SYNTH) -s $(SYNTH_SCRPT_RTLIL)
	$(VC) -I$(INC) -o $(OUTPUT_RTLIL) $(SYNTH_DUT_RTLIL) $(TESTER) $(TB)

# Synthesize with CMOS cells
$(OUTPUT_CMOS): $(DUT)
	$(SYNTH) -s $(SYNTH_SCRPT_CMOS)
	$(VC) -I$(INC) -o $(OUTPUT_CMOS) $(SYNTH_DUT_CMOS) $(CMOS_V) $(TESTER) $(TB)

# Synthesize with CMOS cells
$(OUTPUT_CMOS_DELAY): $(DUT)
	$(SYNTH) -s $(SYNTH_SCRPT_CMOS_DELAY)
	$(VC) -I$(INC) -o $(OUTPUT_CMOS_DELAY) $(SYNTH_DUT_CMOS_DELAY) $(CMOS_V_DELAY) $(TESTER) $(TB)

# Run simulations
run: $(OUTPUT_RTLIL) $(OUTPUT_CMOS) $(OUTPUT_CMOS_DELAY)
	$(SIM) $(OUTPUT_RTLIL)
	@mv $(WAVEFORM) $(WAVEFORM_RTLIL)
	$(SIM) $(OUTPUT_CMOS)
	@mv $(WAVEFORM) $(WAVEFORM_CMOS)
	$(SIM) $(OUTPUT_CMOS_DELAY)
	@mv $(WAVEFORM) $(WAVEFORM_CMOS_DELAY)

# Waveform generation
wave: run
	$(WAVEV) $(WAVEFORM_RTLIL) 		--save $(WAVE_CFG)
	$(WAVEV) $(WAVEFORM_CMOS) 		--save $(WAVE_CFG)
	$(WAVEV) $(WAVEFORM_CMOS_DELAY) --save $(WAVE_CFG)

# Clean binaries
clean:
	@rm -f $(OUTPUT_RTLIL) $(OUTPUT_CMOS) $(OUTPUT_CMOS_DELAY)
	@rm -f $(WAVEFORM_RTLIL) $(WAVEFORM_CMOS) $(WAVEFORM_CMOS_DELAY) $(WAVEFORM) 
	@rm -f $(SYNTH_DUT_CMOS) $(SYNTH_DUT_RTLIL) $(SYNTH_DUT_CMOS_DELAY)
	
# Phony targets
.PHONY: all clean wave run synth_rtlil synth_cmos
