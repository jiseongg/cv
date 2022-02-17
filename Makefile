DOCNAME=cv
OPT=--interaction nonstopmode
QUIET := > /dev/null

all: pdf1 pdf2

pdf1:
	pdflatex $(OPT) $(DOCNAME).tex $(QUIET)

pdf2:
	bibtex $(DOCNAME) $(QUIET)
	pdflatex $(OPT) $(DOCNAME).tex $(QUIET)

clean:
	rm -rf *-blx.bib *.run.xml *.blg *.bbl *.aux *.log *.dvi *.out *.pdf
