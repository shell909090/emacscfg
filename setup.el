;;; setup.el --- 
;; show
(setq inhibit-startup-screen t);; close welcome screen
(setq column-number-mode t);; enable column mode
(setq visible-bell t);; stop annoying bell
(setq frame-title-format "%b");; set title
(menu-bar-mode -1);; remove menu bar
(ignore-errors (tool-bar-mode -1));; remove tool bar
(setq major-mode 'text-mode);; set default mode
(setq x-select-enable-clipboard t);; emacs selection to x clipboard
(fset 'yes-or-no-p 'y-or-n-p);; use y/n to anwser
(setq kill-whole-line t);; kill whole line with C-k in head of line
(setq buffer-file-coding-system 'utf-8-unix);; use unix utf-8 coding default

;; show-paren-mode
(setq show-paren-style 'mixed)
(show-paren-mode t)

;; backup
;; small-temporary-file-directory
(setq
 version-control t
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 backup-directory-alist (list (cons "." (concat temporary-file-directory "backup"))))

;; cc mode，默认使用linux c风格，缩进8
(setq c-default-style "linux" c-basic-offset 8)

;; abbrev mode auto
(setq abbrev-mode t)
(setq save-abbrevs nil)

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

;; uniquify
(ignore-errors
  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward))

;; load desktop
(ignore-errors
  (require 'desktop)
  (desktop-save-mode))

;; load dired-x
(ignore-errors
  (require 'dired-x)
  (setq-default dired-omit-files-p t)
  (setq dired-omit-files "^\\.?#\\|^\\.[^\\.]+"))

;; delete selection mode, not automatically work in emacs23
(delete-selection-mode 1)