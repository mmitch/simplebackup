VERSION=0.1.2cvs
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
