### Makefile --- 

## Author: shell@debian.debian
## Version: $Id: Makefile,v 0.0 2010/01/20 17:13:26 shell Exp $
## Keywords: 
## X-URL: 

all: install

install:
	ln -sf $(shell pwd)/lisp/emacs.el ~/.emacs
	ln -sf $(shell pwd)/lisp/emacs.elc ~/.emacs.elc

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

install-elpa:
	emacs -q --no-splash --script lisp/install.el

clean-elpa:
	rm -rf elpa

clean-venv:
	rm -rf pyenv

install-deb:
	sudo aptitude install magit emacs-goodies-el
	sudo aptitude install exuberant-ctags flake8

install-golang:
	go get -u golang.org/x/tools/cmd/goimports
	go install golang.org/x/tools/cmd/goimports
	go get -u github.com/nsf/gocode
	go install github.com/nsf/gocode
	go get -u github.com/rogpeppe/godef
	go install github.com/rogpeppe/godef
	go get -u golang.org/x/tools/cmd/guru
	go install golang.org/x/tools/cmd/guru
	go get -u github.com/kisielk/errcheck
	go install github.com/kisielk/errcheck

### Makefile ends here
