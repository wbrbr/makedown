SRCDIR = raw
COMPDIR = articles
TEMPLDIR = templates
ARTICLES = $(shell find $(SRCDIR) -name '*.md' -printf '%f \n')

all: index

index: articles
	cat $(TEMPLDIR)/header.html $(TEMPLDIR)/content.html $(TEMPLDIR)/footer.html > index.html
	rm $(TEMPLDIR)/content.html

articles: $(ARTICLES) 

%.md: 
	cat $(TEMPLDIR)/header.html > $(COMPDIR)/$*.html
	redcarpet $(SRCDIR)/$@ >> $(COMPDIR)/$*.html
	cat $(TEMPLDIR)/footer.html >> $(COMPDIR)/$*.html
	echo "<a href=$(COMPDIR)/$*.html>$(shell head -n 1 $(SRCDIR)/$@ | sed 's/#* \(.*\)/\1/g')</a><br/>" >> $(TEMPLDIR)/content.html

config: 
	mkdir -p $(TEMPLDIR)
	mkdir -p $(SRCDIR)
	mkdir -p $(COMPDIR)
