;; setup auto-mode-alist
(add-to-list 'auto-mode-alist (cons "\\.go$" (function go-mode)))
(add-to-list 'auto-mode-alist (cons "\\.markdown$" (function markdown-mode)))

;; cc-mode，默认使用linux c风格，缩进8
(setq c-default-style "linux" c-basic-offset 8)

;; load desktop
(require 'desktop)
(desktop-save-mode)

;; load tabbar
;; (require 'tabbar)
;; (tabbar-mode)

;; load color theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-clarity)

;; load dired-x
(require 'dired-x)
(setq-default dired-omit-files-p t)
(setq dired-omit-files "^\\.?#\\|^\\.[^\\.]+")

;; load auto complete
(require 'auto-complete)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

;; load template
(require 'template)
(setq template-subdirectories '("./" "Templates/" "~/.emacs.d/templates/"))
(template-initialize)
(setq template-auto-insert t)

;; load msf-abbrev
(require 'msf-abbrev)
(setq msf-abbrev-root "~/.emacs.d/mode-abbrevs")
(msf-abbrev-load)

;; load hippie-expand
(setq hippie-expand-try-functions-list
      '( ;;senator-complete-symbol
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

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

;; autoload go mode
(autoload (quote go-mode) "go-mode" "Major mode for editing Go source text." t nil)
