# Copyright 2017
# Edward A. Roualdes
# Makefile for knitr compiling


all: pdf


MAINFILE  := main
RNWFILES  := $(shell find . -type f -name '*.Rnw' ! -name 'main.Rnw')
CACHEDIR  := cache
FIGUREDIR := figs
MAINTEX = $(MAINFILE:=.tex)
MAINPDF = $(MAINFILE:=.pdf)
MAINRNW = $(MAINFILE:=.Rnw)
# BUILD     := $(build) # TODO allow build options


.PHONY: pdf tex clean clearcache cleanall


pdf: $(MAINPDF)


$(CACHEDIR):
	mkdir $(CACHEDIR)


$(FIGUREDIR):
	mkdir $(FIGUREDIR)


$(MAINTEX):%: $(MAINRNW) $(RNWFILES)
	Rscript \
	  -e "library(knitr)" \
	  -e "knitr::opts_chunk[['set']](fig.path='$(FIGUREDIR)/')" \
	  -e "knitr::opts_chunk[['set']](cache.path='$(CACHEDIR)/')" \
	  -e "knitr::knit('$<','$@')"
#	  -e "knitr::opts_chunk[['set']](build='$(BUILD)')" \ # todo allow build opts


$(MAINPDF):%: $(MAINTEX)
	latexmk -f -pdf -quiet $<


clean:
	-latexmk -c -quiet $(MAINFILE).tex
	-rm -f *_handout.*
	-rm -f $(MAINTEX) $(RNWTEX)
	-rm -rf $(FIGUREDIR)
	-rm -f *.snm
	-rm -f *.vrb
	-rm -f *.nav
	-rm -f *.bbl
	# -rm *tikzDictionary


clearcache:
	-rm -rf $(CACHEDIR)


cleanall: clean clearcache
	-rm $(MAINPDF)


open:
	open -a Skim $(MAINPDF)
