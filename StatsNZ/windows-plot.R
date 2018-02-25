
library(extrafont)
loadfonts("win")
loadfonts("pdf")
fontlist <- fonts()

speakers <- read.csv("StatsNZ/maori-language-speakers.csv", header=FALSE)
## par(mfrow=c(3, 1))
## for (i in fontlist) {
## for (i in c("FB", "Bell MT", "Centaur", "Colonna MT", "Microsoft New Tai Lue"))
    ## prompt
    ## readline(paste(i, ":"))
## }
i <- "Microsoft New Tai Lue"
## Pasted char
png("MSNTL-cut-and-paste.png")
barplot(speakers$V4, names.arg=speakers$V1, ylab="Percent",
        main="Speakers of te reo Māori in the Māori ethnic group",
        family=i)
dev.off()
## Unicode escape (look for empty rectangle)
png("MSNTL-unicode-escape.png")
barplot(speakers$V4, names.arg=speakers$V1, ylab="Percent",
        main="Speakers of te reo M\u101ori in the M\u101ori ethnic group",
        family=i)
dev.off()
## Unicode combining macron (looks nice?)
png("MSNTL-unicode-combine.png")
barplot(speakers$V4, names.arg=speakers$V1, ylab="Percent",
        main="Speakers of te reo Ma\u304ori in the Ma\u304ori ethnic group",
        family=i)
dev.off()
## Unicode escape (different font)
png("sans-unicode-escape.png")
barplot(speakers$V4, names.arg=speakers$V1, ylab="Percent",
        main="Speakers of te reo M\u101ori in the M\u101ori ethnic group",
        family="sans")
dev.off()
## But PDF stuffed
pdf("sans-unicode-escape.pdf")
barplot(speakers$V4, names.arg=speakers$V1, ylab="Percent",
        main="Speakers of te reo M\u101ori in the M\u101ori ethnic group",
        family="sans")
dev.off()
## Cairo PDF version ok
cairo_pdf("sans-unicode-escape-cairo.pdf")
barplot(speakers$V4, names.arg=speakers$V1, ylab="Percent",
        main="Speakers of te reo M\u101ori in the M\u101ori ethnic group",
        family="sans")
dev.off()
cairo_pdf("sans-unicode-combine-cairo.pdf")
barplot(speakers$V4, names.arg=speakers$V1, ylab="Percent",
        main="Speakers of te reo Ma\u304ori in the Ma\u304ori ethnic group",
        family="sans")
dev.off()



speakers <- read.csv("StatsNZ/maori-language-speakers.csv", header=FALSE)
par(mar=c(4, 4, 4, 2))
barplot(speakers$V4, names.arg=speakers$V1, ylab="Percent",
        main="Speakers of te reo M\u101ori in the M\u101ori ethnic group")
mtext(expression(italic("Source: Stats NZ")), side=1, at=par("usr")[2],
      line=3, adj=1, col="grey")

barplot(speakers$V4, names.arg=speakers$V1, ylab="Percent",
        main="Speakers of te reo Ma\u304ori in the Ma\u304ori ethnic group")
mtext(expression(italic("Source: Stats NZ")), side=1, at=par("usr")[2],
      line=3, adj=1, col="grey")

windowsFonts(E="Elephant")
barplot(speakers$V4, names.arg=speakers$V1, ylab="Percent",
        main="Speakers of te reo M\u101ori in the M\u101ori ethnic group",
        family="E")
mtext(expression(italic("Source: Stats NZ")), side=1, at=par("usr")[2],
      line=3, adj=1, col="grey")
