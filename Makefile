### Makefile --- 

## Author: shell@debian.debian
## Version: $Id: Makefile,v 0.0 2010/01/20 17:13:26 shell Exp $
## Keywords: 
## X-URL: 
SOURCES=emacs-console.el emacs-keymap.el emacs-linux.el emacs-redef.el emacs-setup.el emacs-win.el

build: $(SOURCES) emacs-plugin.el
	make -C plugins build
	emacs -Q -L . --batch -f batch-byte-compile $(SOURCES)
	emacs -Q -L plugins/ --batch -f batch-byte-compile emacs-plugin.el

clean:
	rm -f *.elc
	make -C plugins clean

install: build
        rm -f ~/.emacs ~/.emacs.bmk
        ln -s $(shell pwd)/emacs.el ~/.emacs
        ln -s $(shell pwd)/emacs.bmk ~/.emacs.bmk

### Makefile ends here
