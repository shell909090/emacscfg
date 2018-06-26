;;; install.el --- 

;; (when (>= emacs-major-version 24)
;;   (require 'package)
;;   (add-to-list
;;    'package-archives
;;    ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
;;    '("melpa" . "http://melpa.milkbox.net/packages/")
;;    t))

(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.milkbox.net/packages/")
 '("marmalade" . "https://marmalade-repo.org/packages/"))

(package-initialize)
(list-packages)

;; (package-install 'auto-complete)
;; (package-install 'dictionary)
;; (package-install 'diredful)
;; (package-install 'edit-server)
;; (package-install 'ein)
;; (package-install 'elpy)
;; (package-install 'flycheck)
;; (package-install 'go-autocomplete)
;; (package-install 'go-guru)
;; (package-install 'golint)
;; (package-install 'go-mode)
;; (package-install 'go-rename)
;; (package-install 'helm)
;; (package-install 'markdown-mode)
;; (package-install 'multi-term)
;; (package-install 'yasnippet)

;; (package-install 'magit)

;; etags-table.el
;; template.el


;;; install.el ends here
