all: white-spruce-organelles-poster.html white-spruce-organelles-poster.pdf white-spruce-organelles-poster-onepage.pdf

.DELETE_ON_ERROR:
.SECONDARY:
.PHONY: all

# Convert Markdown to HTML using Pandoc
%.html: %.md
	pandoc -s -o $@ $<

# Convert Markdown to PDF using Pandoc
%.pdf: %.md
	pandoc -Vgeometry:a4paper,margin=0.25in -Vfontsize=36pt -o $@ $<

# Convert Markdown to LaTeX using Pandoc
%.tex: %.md
	pandoc -s -Vgeometry:a4paper,margin=0.25in -Vfontsize=36pt -o $@ $<

# Combine multiple PDF pages into a single page
%-onepage.pdf: %.pdf
	pdfjam --suffix nup --nup 2x2 --papersize '{32in,32in}' --outfile $@ $< 2-5
