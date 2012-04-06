(require 'python)
(require 'ibuffer)
(require 'top-mode)

;; cc-mode，默认使用linux c风格，缩进8
(require 'cc-mode)
(setq c-default-style "linux" c-basic-offset 8)

;; load multi-term
(require 'multi-term)
(setq multi-term-dedicated-select-after-open-p t)
(setq multi-term-switch-after-close t)
(custom-set-variables
 '(term-default-bg-color "#000000")
 '(term-default-fg-color "#ffffff"))

;; load template
(require 'template)
(setq template-subdirectories '("./" "Templates/" "~/.emacs.d/templates/"))
(template-initialize)
(setq template-auto-insert t)

;; load desktop
(require 'desktop)
(desktop-save-mode)

;; load auto complete
(require 'auto-complete)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

;; load color theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-clarity)

;; load msf-abbrev
(require 'msf-abbrev)
(setq msf-abbrev-root "~/.emacs.d/mode-abbrevs")
(msf-abbrev-load)

;; load dired-x
(require 'dired-x)
(setq-default dired-omit-files-p t)
(setq dired-omit-files "^\\.?#\\|^\\.[^\\.]+")

;; use dictionary-el, not dict in emacs-goodies-el
(setq dictionary-server "localhost")