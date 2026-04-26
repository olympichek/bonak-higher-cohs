TEX := higher-coherences.tex
PDF := $(TEX:.tex=.pdf)
BASE := $(basename $(TEX))

LATEX := pdflatex
LATEXFLAGS := -interaction=nonstopmode -halt-on-error

AUXFILES := \
	$(BASE).aux \
	$(BASE).bbl \
	$(BASE).bcf \
	$(BASE).blg \
	$(BASE).fdb_latexmk \
	$(BASE).fls \
	$(BASE).log \
	$(BASE).nav \
	$(BASE).out \
	$(BASE).run.xml \
	$(BASE).snm \
	$(BASE).synctex.gz \
	$(BASE).toc \
	$(BASE).vrb \
	$(BASE).xdv

.PHONY: all clean

all: $(PDF)

$(PDF): $(TEX)
	$(LATEX) $(LATEXFLAGS) $(TEX)
	$(LATEX) $(LATEXFLAGS) $(TEX)

clean:
	rm -f $(PDF) $(AUXFILES)
