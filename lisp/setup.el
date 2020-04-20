;;; setup.el --- 

;; appearence setup
(setq inhibit-startup-screen t);; close welcome screen
(setq column-number-mode t);; enable column mode
(setq frame-title-format "%b");; set title
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1));; remove menu bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1));; remove tool bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1));; remove scroll bar
(size-indication-mode);; show file size in mode line
(display-time-mode);; show time in mode line
(setq split-width-threshold 240);; split window vertically

;; behavior
(setq major-mode 'text-mode);; set default mode
(setq buffer-file-coding-system 'utf-8-unix);; use unix utf-8 coding default
(prefer-coding-system 'utf-8);; prefer utf-8
(setq kill-whole-line t);; kill whole line with C-k in head of line
(fset 'yes-or-no-p 'y-or-n-p);; use y/n to anwser
(setq visible-bell t);; stop annoying bell
(put 'scroll-left 'disabled nil)

;; delete selection mode, not automatically work in emacs23
(delete-selection-mode 1)

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
 backup-directory-alist `(("." . ,(concat temporary-file-directory "emacs-backup"))))

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

;; (setq url-proxy-services '(("http" . "localhost:3128")))

;; setup elpa
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.milkbox.net/packages/")
 '("marmalade" . "https://marmalade-repo.org/packages/"))

;; desktop load and setup
(require 'desktop)
(desktop-change-dir "~/.emacs.d/")
(desktop-save-mode 1)

;;; setup.el ends here
