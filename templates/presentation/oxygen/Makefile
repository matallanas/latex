TARGET=presentation
TARGET_PRINT=presentation_print
BUILD=build
SRC=src
ANIMATION_TARGET=animation
ANIMATION_FOLDER=animations
TARGET_TIKZ=tikz/tikz
FOLDER_TIKZ=tikz

# make pdf by default
all: ${TARGET}.pdf

%.pdf : ${SRC}/%.tex
	rm -rf $*.pdf
	cp ${SRC}/* ${BUILD}/
	cd ${BUILD}; pdflatex --shell-escape --enable-write18 $*
	cd ${BUILD}; pdflatex --shell-escape --enable-write18 $*
	mv ${BUILD}/$*.pdf  $*.pdf

print: 
	rm -rf ${TARGET_PRINT}.pdf
	cp ${SRC}/* ${BUILD}/
	cd ${BUILD}; pdflatex --shell-escape --enable-write18 ${TARGET_PRINT}.tex
	cd ${BUILD}; pdflatex --shell-escape --enable-write18 ${TARGET_PRINT}.tex
	mv ${BUILD}/${TARGET_PRINT}.pdf  ${TARGET_PRINT}.pdf

anim: 
	cd ${ANIMATION_FOLDER}; pdflatex -shell-escape -enable-write18 ${ANIMATION_TARGET}.tex
	cd ${ANIMATION_FOLDER}; pdflatex -shell-escape -enable-write18 ${ANIMATION_TARGET}.tex
	rm -f ${ANIMATION_FOLDER}/*.aux
	rm -f ${ANIMATION_FOLDER}/*.log
	rm -f ${ANIMATION_FOLDER}/*.pgf-plot.*

cleananim:
	rm -f ${ANIMATION_FOLDER}/*.aux
	rm -f ${ANIMATION_FOLDER}/*.log
	rm -f ${ANIMATION_FOLDER}/*.pgf-plot.*
	rm -f ${ANIMATION_FOLDER}/*.pdf

#Compiles all the tikz pictures
figures: 
	latex -output-directory=${FOLDER_TIKZ} -shell-escape -enable-write18 ${TARGET_TIKZ}.tex 
	cd ${FOLDER_TIKZ}; make -f ${FOLDER_TIKZ}.makefile
	rm -f ${TARGET_TIKZ}.aux
	rm -f ${TARGET_TIKZ}.dvi
	rm -f ${TARGET_TIKZ}.figlist
	rm -f ${TARGET_TIKZ}.log
	rm -f ${TARGET_TIKZ}.makefile
	rm -f ${TARGET_TIKZ}.out
	rm -f ${TARGET_TIKZ}.pdf
	rm -f ${FOLDER_TIKZ}/*.dpth
	rm -f ${FOLDER_TIKZ}/*.dep
	rm -f ${FOLDER_TIKZ}/*.log
	rm -f ${FOLDER_TIKZ}/*.gnuplot
	rm -f ${FOLDER_TIKZ}/*.md5
	rm -f ${FOLDER_TIKZ}/*.table
	#mv -f ${FOLDER_TIKZ}/*.eps figs/
#Compile only a figure make figure a=NAME_FIG
figure:
	latex -output-directory=${FOLDER_TIKZ} -shell-escape -enable-write18 ${TARGET_TIKZ}.tex 
	cd ${FOLDER_TIKZ}; make -f ${FOLDER_TIKZ}.makefile $a.epsi
	rm -f ${FOLDER_TIKZ}/*.aux
	rm -f ${FOLDER_TIKZ}/*.dvi
	rm -f ${FOLDER_TIKZ}/*.log
	#rm -f ${FOLDER_TIKZ}/*.pdf
	rm -f ${FOLDER_TIKZ}/*.dpth
	rm -f ${FOLDER_TIKZ}/*.md5
	rm -f ${FOLDER_TIKZ}/*.dep
	rm -f ${FOLDER_TIKZ}/*.log
	rm -f ${FOLDER_TIKZ}/*.gnuplot
	rm -f ${FOLDER_TIKZ}/*.table
	#mv -f ${FOLDER_TIKZ}/$a.eps figs

cleanfigs:
	rm -f ${TARGET_TIKZ}.aux
	rm -f ${TARGET_TIKZ}.dvi
	rm -f ${TARGET_TIKZ}.figlist
	rm -f ${TARGET_TIKZ}.log
	rm -f ${TARGET_TIKZ}.makefile
	rm -f ${TARGET_TIKZ}.out
	rm -f ${TARGET_TIKZ}.pdf
	rm -f ${FOLDER_TIKZ}/*.eps
	rm -f ${FOLDER_TIKZ}/*.dpth
	rm -f ${FOLDER_TIKZ}/*.md5
	rm -f ${FOLDER_TIKZ}/*.dep
	rm -f ${FOLDER_TIKZ}/*.log
	rm -f ${FOLDER_TIKZ}/*.gnuplot
	rm -f ${FOLDER_TIKZ}/*.table

cleanfig:
	rm -f ${FOLDER_TIKZ}/$a.eps
	rm -f ${FOLDER_TIKZ}/$a.dpth
	rm -f ${FOLDER_TIKZ}/$a.md5
	rm -f ${FOLDER_TIKZ}/$a.dep
	rm -f ${FOLDER_TIKZ}/$a.log
	rm -f ${FOLDER_TIKZ}/$a.gnuplot
	rm -f ${FOLDER_TIKZ}/$a.table

clean:
	rm -rf ${BUILD}/*
	rm -rf figs/*.pdf
	rm -rf ${TARGET}.pdf

PHONY : ps all clean reallyclean
