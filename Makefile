# Makefile for pure data class soundtouch~
lib.name := soundtouch

STDIR = ./resources/soundtouch/source/SoundTouch

soundtouch~.class.sources := \
${STDIR}/AAFilter.cpp \
${STDIR}/cpu_detect_x86.cpp \
${STDIR}/mmx_optimized.cpp \
${STDIR}/FIFOSampleBuffer.cpp \
${STDIR}/RateTransposer.cpp \
${STDIR}/FIRFilter.cpp \
${STDIR}/InterpolateCubic.cpp \
${STDIR}/InterpolateLinear.cpp \
${STDIR}/InterpolateShannon.cpp \
${STDIR}/sse_optimized.cpp \
${STDIR}/TDStretch.cpp \
${STDIR}/SoundTouch.cpp \
src/soundtouch~.cpp


uname := $(shell uname -s)

ifeq (Darwin,$(findstring Darwin,$(uname)))
	cflags := -I ./resources/soundtouch/include/ -stdlib=libc++ -mmacosx-version-min=10.7
else
	cflags := -I ./resources/soundtouch/include/
endif


datafiles = \
README.md \
soundtouch~-help.pd \


# include Makefile.pdlibbuilder from submodule directory 'pd-lib-builder'
PDLIBBUILDER_DIR=resources/pd-lib-builder/
include $(PDLIBBUILDER_DIR)/Makefile.pdlibbuilder

