### Makefile --- 

## Author: shell@debian.debian
## Version: $Id: Makefile,v 0.0 2010/01/20 17:13:26 shell Exp $
## Keywords: 
## X-URL: 
SOURCES=keymap.el redef.el setup.el
EMACS-CONFIG=emacs-console.el emacs-linux.el emacs-win.el

build: $(SOURCES) $(EMACS-CONFIG) plugins.el
	make -C plugins build
	emacs -Q -L . --batch -f batch-byte-compile $(SOURCES)
	emacs -Q -L . --batch -f batch-byte-compile $(EMACS-CONFIG)
	emacs -Q -L plugins/ --batch -f batch-byte-compile plugins.el

clean:
	rm -f *.elc
	make -C plugins clean

install: build
	rm -f ~/.emacs ~/.emacs.elc
	ln -s $(shell pwd)/emacs.el ~/.emacs
	emacs -Q --batch -f batch-byte-compile ~/.emacs

### Makefile ends here
