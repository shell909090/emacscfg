(require 'python)
(require 'ibuffer)
(require 'top-mode)

;; load multi-term
(require 'multi-term)
(setq multi-term-dedicated-select-after-open-p t)
(setq multi-term-switch-after-close t)

;; load template
(require 'template)
;;here set the templates directory
(setq template-subdirectories '("./" "Templates/" "~/.emacs.d/templates/"))
(template-initialize)
(setq template-auto-insert t)

;; load desktop
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

(require 'dired-x)
(setq-default dired-omit-files-p t)
(setq dired-omit-files "^\\.?#\\|^\\.[^\\.]+")
