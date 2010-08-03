#
# Edit the $FILES and $FIGURES variables before you run this makefile.
#

SHELL=/bin/sh
RM=/bin/rm
MV=/bin/mv

PREFIX=/usr/bin
LATEX=$(PREFIX)/latex
BIBTEX=$(PREFIX)/bibtex
DVIPS=$(PREFIX)/dvips
DVIPDF=$(PREFIX)/dvipdf
PDFLATEX=$(PREFIX)/pdflatex
PS2PDF=$(PREFIX)/ps2pdf
VIEWER=$(PREFIX)/acroread
DETEX=$(PREFIX)/detex

# If you use vi replace this with ctags.
TAGS=$(PREFIX)/etags

.SUFFIXES:      .tex .dvi .eps .ps .pdf

.PHONEY: 	all clean tags view neat wc

MAIN = thesis

FIGDIR = figures

CHAPDIR = chapters

# Add your own .eps figures to this list.
FIGURES = $(FIGDIR)/mandelbrot.eps

# Add your own LaTeX files to this list.
FILES = thesis.tex thesis.sty \
	abstract.tex ack.tex contents.tex tables.tex figures.tex	\
	$(CHAPDIR)/introduction.tex $(CHAPDIR)/example.tex $(CHAPDIR)/app-example.tex \
	bib.tex refs/example1.bib refs/example2.bib

###
### DO NOT EDIT BELOW THIS LINE UNLESS YOU REALLY KNOW WHAT YOU'RE DOING!
###

all:    thesis.pdf
	$(VIEWER) $<

$(MAIN).dvi:    $(MAIN).tex $(FIGURES) $(FILES)
	$(LATEX) $*.tex; 
	$(BIBTEX) $*;
	$(LATEX) $*.tex;
	while grep -s 'Rerun' $*.log 2> /dev/null; do	\
		$(LATEX) $*.tex;			\
	done

.dvi.ps:        $*.dvi
	$(DVIPS) -t letter -o $@ $<

.ps.pdf:       $*.dvi
	$(PS2PDF) $< $@

view:       $(MAIN).pdf
	- $(VIEWER) $<

clean:
	- $(RM) -f *.aux \
        $(CHAPDIR)/*.aux \
		$(MAIN).log $(MAIN).dvi $(MAIN).ps $(MAIN).blg $(MAIN).bbl \
		$(MAIN).lot $(MAIN).lol $(MAIN).lof $(MAIN).toc $(MAIN).pdf 

# Generate a TAGS file for Emacs etags.
# Replace etags with ctags if you use vi.
tags:
	find . -name "*.tex" -print0 | xargs -0 $(TAGS)

# Suggested by Neil B.
neat:
	$(RM) -f *.aux \
        $(CHAPDIR)/*.aux \
		$(MAIN).log $(MAIN).blg $(MAIN).bbl \
		$(MAIN).lot $(MAIN).lof $(MAIN).toc

# Count words in thesis
wc:
	-@ echo 
	-@ echo -n "UoW thesis, current word count: "
	-@ $(DETEX) $(CHAPDIR)/*.tex | wc -w
	-@ echo 
