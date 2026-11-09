CV_SOURCE ?= cv-template.tex
CV_OUTDIR ?= output/pdf
CV_NAME := $(basename $(notdir $(CV_SOURCE)))

.PHONY: pdf preview clean

pdf:
	latexmk -xelatex -outdir="$(CV_OUTDIR)" "$(CV_SOURCE)"

preview: pdf
	pdftoppm -scale-to 1800 -png -singlefile "$(CV_OUTDIR)/$(CV_NAME).pdf" "$(CV_OUTDIR)/$(CV_NAME)"

clean:
	latexmk -c -outdir="$(CV_OUTDIR)" "$(CV_SOURCE)"
