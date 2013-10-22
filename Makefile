### Makefile --- 

## Author: shell@debian.debian
## Version: $Id: Makefile,v 0.0 2010/01/20 17:13:26 shell Exp $
## Keywords: 
## X-URL: 

all: update install

update: clean build

build:
	emacs -q --no-splash -L plugins/ -batch --eval '(byte-recompile-directory "." 0)'

clean:
	find . -name '*.elc' -delete

install:
	ln -sf $(shell pwd)/emacs.el ~/.emacs
	ln -sf $(shell pwd)/emacs.elc ~/.emacs.elc

### Makefile ends here
