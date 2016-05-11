all: white-spruce-organelles-poster.html white-spruce-organelles-poster.pdf

.DELETE_ON_ERROR:
.SECONDARY:
.PHONY: all

# Convert Markdown to HTML using Pandoc
%.html: %.md
	pandoc -s -o $@ $<

# Convert Markdown to PDF using Pandoc
%.pdf: %.md
	pandoc -o $@ $<
