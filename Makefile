SRCDIR = raw
COMPDIR = articles
TEMPLDIR = templates
ARTICLES = $(shell ls $(SRCDIR))

all: index

index: articles
	cat $(TEMPLDIR)/header.html $(TEMPLDIR)/content.html $(TEMPLDIR)/footer.html > index.html
	rm $(TEMPLDIR)/content.html

articles: $(ARTICLES) 

%.md: 
	cat $(TEMPLDIR)/header.html > $(COMPDIR)/$*.html
	redcarpet $(SRCDIR)/$@ >> $(COMPDIR)/$*.html
	cat $(TEMPLDIR)/footer.html >> $(COMPDIR)/$*.html
	echo "<a href=$(COMPDIR)/$*.html>$*</a>" >> $(TEMPLDIR)/content.html

config: 
	mkdir -p $(TEMPLDIR)
	mkdir -p $(SRCDIR)
	mkdir -p $(COMPDIR)
