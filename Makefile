# Makefile for Dingjiw

# Compiling method: latexmk/xelatex/pdflatex
METHOD = latexmk
# Set opts for latexmk if you use it
LATEXMKOPTS = -xelatex -interaction=nonstopmode  -shell-escape
# Basename of thesis
DINGJIAMAIN = main
# Basename of shuji
SHUJIMAIN = shuji
#TEMPFILE := $(shell find . -type f -name "*.aux" -o -type f -name "fucktrash"\)
TEMPFILE := $(shell find . -type f -name "*.aux" -o -type f -name "*.log") 
TEMPDIR := $(shell find . -maxdepth 4 -type d -name "auto") 
DINGJIACONTENTS=$(DINGJIAMAIN).tex data/*.tex $(FIGURES)
DINGJIACLEAN=$(DINGJIAMAIN).xdv *.run.xml  $(TEMPFILE) $(TEMPDIR) *.bbl *.bcf svg-*
# NOTE: update this to reflect your local file types.
FIGURES=$(wildcard figures/*.eps figures/*.pdf figures/*.jpg figures/*.png)
BIBFILE=ref/*.bib

# make deletion work on Windows
RM = rm -f
OPEN = okular

.PHONY: all doc viewdoc clean distclean 

all: distclean doc viewdoc

viewdoc: doc
	echo ${MAKE_HOST}
	-@$(OPEN) $(DINGJIAMAIN).pdf &

doc: $(DINGJIAMAIN).pdf

$(DINGJIAMAIN).pdf: $(DINGJIAMAIN).tex
	$(METHOD) $(LATEXMKOPTS) $(DINGJIAMAIN)

clean:
	latexmk -C 
	-@$(RM) *~
	-@$(RM) -rf $(DINGJIACLEAN)

distclean: clean
	-@$(RM) $(DINGJIAMAIN).pdf

