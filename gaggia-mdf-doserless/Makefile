

SCAD := $(shell ls *.scad)
STL := $(patsubst %.scad,%.stl,$(SCAD))

.PHONY: all
all: $(STL)
	@echo "SCAD $(SCAD)"
	@echo "STL $(STL)"

%.stl: %.scad
	openscad -o $@ $^
