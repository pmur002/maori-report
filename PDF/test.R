
plot(1, main="Māori")

## Font with amacron character
## NOTE the special encoding
## NOTE that it is vital that the special encoding has its own name
## NOTE that it is ALSO vital that the special characters are BELOW
##      128 so that we do not call mbcsToSbcs() (and get the error
##      about "unknown encoding")
TGFont <- Type1Font("TG",
                    paste0("/usr/share/texmf/fonts/afm/public/tex-gyre/",
                           c("qtmr.afm", "qtmb.afm", "qtmri.afm", "qtmbi.afm")),
                    encoding="./macrons.enc")
pdfFonts(TG=TGFont)
## Customised encoding with amacron below 256 (?)
## BUT still with known encoding file name so mbcsToSbcs() works
pdf("test.pdf", family="TG", compress=FALSE, encoding="./macrons.enc")
plot(1, main="M\041ori")
dev.off()
embedFonts("test.pdf", outfile="test-embed.pdf",
           fontpaths="/usr/share/texmf/fonts/opentype/public/tex-gyre/")

## Just standard Helvetica font
HelvMacron <- Type1Font("HM",
                        c("Helvetica.afm", "Helvetica-Bold.afm",
                          "Helvetica-Oblique.afm",
                          "Helvetica-BoldOblique.afm"),
                        encoding="./macrons.enc")
pdfFonts(HM=HelvMacron)
## Customised encoding with amacron below 256 (?)
## BUT still with known encoding file name so mbcsToSbcs() works
pdf("test.pdf", family="HM", compress=FALSE, encoding="./macrons.enc")
plot(1, main="M\030ori")
plot(1, main="\020 \021 \022 \023 \024 \030 \031 \032 \033 \034")
dev.off()
embedFonts("test.pdf", outfile="test-embed.pdf")

## Just standard font
## Customised encoding with amacron below 256 (?)
## BUT still with known encoding file name so mbcsToSbcs() works
pdf("test.pdf", compress=FALSE, encoding="./macrons.enc")
plot(1, main="M\030ori")
plot(1, main="\020 \021 \022 \023 \024 \030 \031 \032 \033 \034")
dev.off()
embedFonts("test.pdf", outfile="test-embed.pdf")

## Just standard Helvetica font AND standard ISOLatin7.enc
pdf("test.pdf", compress=FALSE, encoding="ISOLatin7.enc")
plot(1, main="M\342ori")
dev.off()
embedFonts("test.pdf", outfile="test-embed.pdf")

## On Linux ...
## To install new locales ...
## sudo dpkg-reconfigure locales 
Sys.setlocale("LC_CTYPE", "el_GR.ISO-8859-7")
pdf("test.pdf", family="sans", compress=FALSE, encoding="ISOLatin7.enc")
plot(1, main="M\342ori")
dev.off()
Sys.setlocale("LC_CTYPE", "en_NZ.UTF-8")

## On Windows ...
Sys.setlocale("LC_CTYPE", "Greek_Greece.1257")
pdf("test.pdf", family="sans", compress=FALSE, encoding="ISOLatin7.enc")
plot(1, main="M\342ori")
dev.off()
Sys.setlocale("LC_CTYPE", "English_New Zealand.1252")
