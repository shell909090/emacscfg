;;; plugins.el --- 
;; autoload go mode
(autoload 'go-mode "go-mode" "Major mode for editing Go source text." t)

;; setup auto-mode-alist
(add-to-list 'auto-mode-alist (cons "\\.go$" 'go-mode))
(add-to-list 'auto-mode-alist (cons "\\.md$" 'markdown-mode))

;; pylookup
(setq pylookup-dir "~/.emacs.d/")
(setq pylookup-program (concat pylookup-dir "/pylookup.py"))
(setq pylookup-db-file (concat pylookup-dir "/pylookup.db"))
;; set search option if you want
;; (setq pylookup-search-options '("--insensitive" "0" "--desc" "0"))
;; to speedup, just load it on demand
(autoload 'pylookup-lookup "pylookup"
  "Lookup SEARCH-TERM in the Python HTML indexes." t)
(autoload 'pylookup-update "pylookup" 
  "Run pylookup-update and create the database at `pylookup-db-file'." t)

;; python ropemacs mode
(ignore-errors
  (require 'pymacs)
  (pymacs-load "ropemacs" "rope-")
  (define-key ropemacs-local-keymap "\C-cd" nil)
  (define-key ropemacs-local-keymap "\C-cf" nil)
  (define-key ropemacs-local-keymap "\C-ci" 'rope-auto-import)
  (define-key ropemacs-local-keymap "\C-co" 'rope-find-occurrences)
  (setq ropemacs-confirm-saving 'nil)
  (setq ropemacs-enable-autoimport 't))

;; load color theme
(ignore-errors
  (require 'color-theme)
  (color-theme-initialize)
  (color-theme-clarity))

;; load auto complete
(ignore-errors
  (require 'auto-complete)
  (global-auto-complete-mode t)
  (define-key ac-complete-mode-map "\C-n" 'ac-next)
  (define-key ac-complete-mode-map "\C-p" 'ac-previous))

;; load template
(ignore-errors
  (require 'template)
  (setq template-subdirectories '("./" "Templates/" "~/.emacs.d/templates/"))
  (template-initialize)
  (setq template-auto-insert t))

;; load msf-abbrev
(ignore-errors
  (require 'msf-abbrev)
  (setq msf-abbrev-root "~/.emacs.d/mode-abbrevs")
  (msf-abbrev-load))

;; autoload multi-term
(autoload 'multi-term "multi-term" "multi terminal" t)
(autoload 'multi-term-dedicated-open "multi-term" "multi terminal" t)
(setq multi-term-dedicated-select-after-open-p t)
(setq multi-term-switch-after-close t)
(custom-set-variables
 '(term-default-bg-color "#000000")
 '(term-default-fg-color "#ffffff"))

;; autoload top
(autoload 'top "top-mode" "top mode" t)

;; use dictionary-el, not dict in emacs-goodies-el
(setq dictionary-server "localhost")