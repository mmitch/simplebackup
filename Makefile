# $Id: Makefile,v 1.11 2006-07-30 16:25:32 mitch Exp $

VERSION=0.0.9
NAME=simplebackup-$(VERSION)
TAR=$(NAME).tar.gz

SCRIPTS=expirebackups simplebackup
MANPAGES=expirebackups.1 simplebackup.1 simplebackup.conf.5
DOCS=README COPYING HISTORY
EXAMPLES=simplebackup.conf
FILES=$(SCRIPTS) $(MANPAGES) $(DOCS) $(EXAMPLES)

all: $(MANPAGES)

clean:
	rm -f $(MANPAGES)
	rm -f *~

dist:	clean all
	rm -rf $(NAME)
	mkdir $(NAME)
	cp $(FILES) $(NAME)
	tar -czvf $(TAR) $(NAME)
	rm -rf $(NAME)

%.1: %.in.1
	sed s/%%%VERSION%%%/$(VERSION)/g  $< > $@

%.5: %.in.5
	sed s/%%%VERSION%%%/$(VERSION)/g $< > $@
