SOURCES=rapportmall.tex
BIBTEX=bibtex

TARGET=build

RM = /bin/rm -f
LATEX=/usr/bin/xelatex

PDF_OBJECTS=$(SOURCES:.tex=.pdf)
BIB_OBJECTS=$(SOURCES:.tex=.aux)

all: $(TARGET)
	$(LATEX) -interaction=batchmode -output-directory=$(TARGET) rapportmall.tex
	$(BIBTEX) $(TARGET)/$(BIB_OBJECTS)
	$(LATEX) -interaction=batchmode -output-directory=$(TARGET) rapportmall.tex
	$(LATEX) -interaction=batchmode -output-directory=$(TARGET) rapportmall.tex

$(TARGET):
	-mkdir $(TARGET)

clean:
	-$(RM) -r $(TARGET)
