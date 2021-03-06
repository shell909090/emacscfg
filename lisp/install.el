;;; install.el --- 

(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.milkbox.net/packages/")
 '("marmalade" . "https://marmalade-repo.org/packages/"))

(package-initialize)
(list-packages)


(package-install 'auto-complete)
(package-install 'color-theme)
(package-install 'dictionary)
(package-install 'diredful)
(package-install 'ein)
(package-install 'elpy)
(package-install 'flycheck)
(package-install 'go-autocomplete)
(package-install 'go-errcheck)
(package-install 'go-guru)
(package-install 'go-mode)
(package-install 'helm)
(package-install 'markdown-mode)
(package-install 'multi-term)
(package-install 'yasnippet)

;; (package-install 'magit)

;; etags-table.el
;; template.el


;;; install.el ends here
