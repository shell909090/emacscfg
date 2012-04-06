### Makefile --- 

## Author: shell@debian.debian
## Version: $Id: Makefile,v 0.0 2010/01/20 17:13:26 shell Exp $
## Keywords: 
## X-URL: 
SOURCES=emacs.elc keymap.elc userfunc.elc setup.elc
EMACS-CONFIG=emacs-console.elc emacs-linux.elc emacs-win.elc

build: $(SOURCES) $(EMACS-CONFIG) plugins.elc
	make -C plugins build

plugins.elc: plugins.el
	emacs -Q -L plugins/ --batch -f batch-byte-compile plugins.el

%.elc: %.el
	emacs -Q -L . --batch -f batch-byte-compile $^

clean:
	rm -f *.elc
	make -C plugins clean

install: build
	rm -f ~/.emacs ~/.emacs.elc
	ln -s $(shell pwd)/emacs.el ~/.emacs
	ln -s $(shell pwd)/emacs.elc ~/.emacs.elc

### Makefile ends here
