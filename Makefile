SRCDIR := raw
COMPDIR := articles
TEMPLDIR := templates
SRC := $(wildcard $(SRCDIR)/*.md)
ARTICLES := $(addprefix $(COMPDIR)/,$(notdir $(SRC:.md=.html)))

all: $(ARTICLES)

$(COMPDIR)/%.html: $(SRCDIR)/%.md
	@cat $(TEMPLDIR)/header.html > tmp
	@markdown $< >> tmp
	@cat $(TEMPLDIR)/footer.html >> tmp
	@mv tmp $@

clean:
ifneq ($(shell ls $(COMPDIR)), )
	rm -r $(COMPDIR)/* 
else
	@echo 'Alreay clean'
endif
