DOCNAME=cv
OPT=--interaction nonstopmode
QUIET := > /dev/null
DATE=$(shell date +"%Y.%m.%d")

all: check-name pdf1 pdf2 rename

pdf1:
	pdflatex $(OPT) $(DOCNAME).tex $(QUIET)

pdf2:
	bibtex $(DOCNAME) $(QUIET)
	pdflatex $(OPT) $(DOCNAME).tex $(QUIET)

rename:
	mv $(DOCNAME).pdf "$(NAME)-CV($(DATE)).pdf"

check-name:
ifndef NAME
	$(error NAME should be passed)
endif

clean:
	rm -f *.blg *.bbl *.aux *.log *.dvi *.out *.pdf *.synctex* *.fdb_latexmk *.pdfsync *.run.xml *.fls *-blx.bib 
