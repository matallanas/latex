TARGET=presentacion
BUILD=build
SRC=src
# make pdf by default
all: ${TARGET}.pdf

%.pdf : ${SRC}/%.tex
	rm -rf $*.pdf
	cp ${SRC}/* ${BUILD}/
	cd ${BUILD}; pdflatex --shell-escape --enable-write18 $*
	cd ${BUILD}; pdflatex --shell-escape --enable-write18 $*
	mv ${BUILD}/$*.pdf  $*.pdf

clean:
	rm -rf ${BUILD}/*
	rm -rf figs/*.pdf
	rm -rf ${TARGET}.pdf

PHONY : ps all clean reallyclean
