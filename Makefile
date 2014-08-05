INKSCAPE = inkscape
GHOSTSCRIPT = gs

SLIDES = pag1.pdf \
         pag2.pdf \
         pag3.pdf \
         pag4.pdf \
         pag5.pdf

PDF = CV_FelipeSanches.pdf

all: $(PDF)

clean:
	rm -rf $(SLIDES)
	rm $(PDF)

pag%.pdf: pag%.svg
	$(INKSCAPE) -f $< --export-pdf=$@

$(PDF): $(SLIDES)
	$(GHOSTSCRIPT) -q -sPAPERSIZE=letter -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$(PDF) $(SLIDES)
	evince $(PDF)
