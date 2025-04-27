;;; install.el --- 

(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.milkbox.net/packages/")
 '("marmalade" . "https://marmalade-repo.org/packages/"))

(package-initialize)
(list-packages)


(package-install 'auto-complete)
(package-install 'color-theme-modern) ;; color-theme is deprcated and replaced by color-theme-modern, https://github.com/emacs-jp/replace-colortheme
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
(package-install 'kubernetes)
(package-install 'markdown-mode)
(package-install 'multi-term)
(package-install 'pkg-info)
(package-install 'popup)
(package-install 'terraform-mode)
(package-install 'yaml-mode)
(package-install 'yasnippet)


;; (package-install 'magit)

;; etags-table.el
;; template.el


;;; install.el ends here
