### Makefile --- 

## Author: shell@debian.debian
## Version: $Id: Makefile,v 0.0 2010/01/20 17:13:26 shell Exp $
## Keywords: 
## X-URL: 

all: install

update: clean build

build:
	emacs -q --no-splash -batch --eval '(byte-recompile-directory "plugins" 0)'
	emacs -q --no-splash -L plugins/ -batch --eval '(byte-recompile-directory "lisp" 0)'

clean:
	find . -name '*.elc' -delete
	find . -name '*.pyc' -delete

install-venv:
	mkdir -p pyenv
	virtualenv pyenv
	pyenv/bin/pip install --upgrade rope
	pyenv/bin/pip install --upgrade jedi
	pyenv/bin/pip install --upgrade importmagic
	pyenv/bin/pip install --upgrade autopep8
	pyenv/bin/pip install --upgrade yapf

clean-venv:
	rm -rf pyenv

install:
	ln -sf $(shell pwd)/lisp/emacs.el ~/.emacs
	ln -sf $(shell pwd)/lisp/emacs.elc ~/.emacs.elc

### Makefile ends here
