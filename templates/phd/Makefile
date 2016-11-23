TARGET=thesis
TARGET_BIB=biblio
BUILD=build
SRC=src
TARGET_TIKZ=tikz/tikz
FOLDER_TIKZ=tikz

# make pdf by default
all:    ${TARGET}.pdf

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

alldoc:
	make figures
	make all

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

clean:
	rm -f ${TARGET}.pdf
	rm -f ${BUILD}/*

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

cleanall:
	rm -f ${TARGET}.log
	rm -f ${TARGET}.aux
	rm -f ${TARGET}.ps
	rm -f ${TARGET}.dvi
	rm -f ${TARGET}.bbl
	rm -f ${TARGET}.blg
	rm -f ${TARGET}.toc
	rm -f ${TARGET}.out
	rm -f ${TARGET}.pdf
	rm -f ${TARGET_TIKZ}.aux
	rm -f ${TARGET_TIKZ}.dvi
	rm -f ${TARGET_TIKZ}.figlist
	rm -f ${TARGET_TIKZ}.log
	rm -f ${TARGET_TIKZ}.makefile
	rm -f ${TARGET_TIKZ}.out
	rm -f ${TARGET_TIKZ}.pdf
	rm -f ${FOLDER_TIKZ}/*.dpth
	rm -f ${FOLDER_TIKZ}/*.md5
	rm -f ${FOLDER_TIKZ}/*.dep
	rm -f ${FOLDER_TIKZ}/*.log
	rm -f ${FOLDER_TIKZ}/*.gnuplot
	rm -f ${FOLDER_TIKZ}/*.table

reallyclean: clean
	rm -f ${TARGET}.{ps,pdf}

