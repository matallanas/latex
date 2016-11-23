TARGET=pfc
TARGET_BIB=biblio
BUILD=build
SRC=src
# make pdf by default
all: ${TARGET}.pdf

%.pdf : %.dvi	
	cd ${SRC}; latex -output-directory=../${BUILD} $* 
	cd ${SRC}; latex -output-directory=../${BUILD} $* 
	cd ${BUILD}; dvipdfm -o ../$*.pdf $*.dvi 

${TARGET}.bbl: ${SRC}/${TARGET_BIB}.bib
# in case we don't already have a .aux file listing citations
# this should probably be a separate makefile target/dependency instead
# of doing it every time... but *shrug*
	cd ${SRC}; latex -output-directory=../${BUILD} ${TARGET}.tex
# get the citations out of the bibliography
	cd ${BUILD}; BIBINPUTS="../${SRC}:" BSTINPUT="../${SRC}:" TEXMFOUTPUT=".:" bibtex ${TARGET} 
	# create glossary
	cd ${SRC}; makeglossaries -d ../${BUILD} ${TARGET}
# do it again in case there are out-of-order cross-references
	cd ${SRC}; latex -output-directory=../${BUILD} ${TARGET}.tex 

${TARGET}.dvi: ${TARGET}.bbl ${SRC}/${TARGET}.tex
	cd ${SRC}; latex -output-directory=../${BUILD} ${TARGET}.tex 

clean:
	rm -f ${TARGET}.pdf
	rm -f ${BUILD}/*

reallyclean: clean
	rm -f ${TARGET}.{ps,pdf}

PHONY : ps all clean reallyclean
