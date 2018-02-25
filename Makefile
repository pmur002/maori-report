
TARFILE = ../maori-deposit-$(shell date +'%Y-%m-%d').tar.gz

%.xml: %.cml
	# Protect HTML special chars in R code chunks
	Rscript -e 't <- readLines("$*.cml"); writeLines(gsub("str>", "strong>", gsub("<rcode([^>]*)>", "<rcode\\1><![CDATA[", gsub("</rcode>", "]]></rcode>", t))), "$*.xml")'
	Rscript toc.R $*.xml
	Rscript bib.R $*.xml

%.Rhtml : %.xml
	# Transform to .Rhtml
	xsltproc knitr.xsl $*.xml > $*.Rhtml

%.html : %.Rhtml
	# Use knitr to produce HTML
	Rscript -e 'library(knitr); knit("$<")'

web:
	cp -r ../maori/* ~/Web/Reports/maori/

zip:
	tar zcvf $(TARFILE) ./*
