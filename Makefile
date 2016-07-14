################################################################################
# Copyright 2015
# Edward A. Roualdes
# adapted from Andrew Redd 11/23/2011: https://gist.github.com/halpo/1405945
#
# Description of File:
# Makefile for knitr compiling
# 
################################################################################
all:pdf  # default rule DO NOT EDIT
################################################################################
MAINFILE  := main
RNWFILES  := $(shell find . -type f -name '*.Rnw' ! -name 'main.Rnw')
RFILES    := 
TEXFILES  := $(shell find . -type f -name '*.tex' ! -name 'main.tex')
CACHEDIR  := cache
FIGUREDIR := figs
BUILD     := $(build)
LATEXMK_FLAGS := 
##### Explicit Dependencies #####
################################################################################
RNWTEX = $(RNWFILES:.Rnw=.tex)
ROUTFILES = $(RFILES:.R=.Rout)
RDATAFILES = $(RFILES:.R=.Rdata)
MAINTEX = $(MAINFILE:=.tex)
MAINPDF = $(MAINFILE:=.pdf)
ALLTEX = $(MAINTEX) $(RNWTEX) $(TEXFILES)

# Dependencies
$(RNWTEX): $(RDATAFILES)
$(MAINTEX): $(RNWTEX) $(TEXFILES)
$(MAINPDF): $(MAINTEX) $(ALLTEX) 

.PHONY:pdf tex clean clearcache cleanall
pdf: $(MAINPDF)
tex: $(RDATAFILES) $(ALLTEX) 

$(CACHEDIR):
	mkdir $(CACHEDIR)

$(FIGUREDIR):
	mkdir $(FIGUREDIR)

%.tex: %.Rnw
	Rscript \
	  -e "library(knitr)" \
	  -e "knitr::opts_chunk[['set']](fig.path='$(FIGUREDIR)/$*-')" \
	  -e "knitr::opts_chunk[['set']](cache.path='$(CACHEDIR)/$*-')" \
	  -e "knitr::opts_chunk[['set']](build='$(BUILD)')" \
	  -e "knitr::knit('$<','$@')"

%.R: %.Rnw
	Rscript -e "Sweave('$^', driver=Rtangle())"

%.Rout: %.R
	R CMD BATCH "$^" "$@"

%.pdf: %.tex
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
