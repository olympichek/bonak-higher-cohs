TEX := higher-coherences.tex
PDF := $(TEX:.tex=.pdf)
BASE := $(basename $(TEX))

LATEXMK := latexmk
LATEXMKFLAGS := -pdf -interaction=nonstopmode -halt-on-error -file-line-error

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
	$(LATEXMK) $(LATEXMKFLAGS) $(TEX)

clean:
	rm -f $(PDF) $(AUXFILES)
