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

;; behavior
(setq major-mode 'text-mode);; set default mode
(setq buffer-file-coding-system 'utf-8-unix);; use unix utf-8 coding default
(prefer-coding-system 'utf-8);; prefer utf-8
(setq x-select-enable-clipboard t);; emacs selection to x clipboard
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

;; environment setup
;; (setenv "PATH" "~/workspace/gocode/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:~/bin")
(setq exec-path
      (append exec-path
	      '("~/workspace/gocode/bin" "/usr/local/sbin" "/usr/sbin" "/sbin" "/bin" "~/bin")))

;; (setq url-proxy-services '(("http" . "localhost:3128")))

;; setup elpa
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.milkbox.net/packages/")
 '("marmalade" . "https://marmalade-repo.org/packages/"))

;; abbrev mode setup
(setq
 abbrev-mode t ;; abbrev auto
 save-abbrevs nil)

;; auto complete load and setup
(require 'auto-complete)
(global-auto-complete-mode t)
(ac-config-default)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

;; bookmark mode setup, exchange c and e keybind
(eval-after-load "bookmark"
  '(progn
     (define-key bookmark-bmenu-mode-map "c" 'bookmark-bmenu-edit-annotation)
     (define-key bookmark-bmenu-mode-map "e" 'bookmark-bmenu-select)))

;; ediff mode
(setq ediff-split-window-function 'split-window-horizontally)

;; elpy
(eval-after-load "elpy"
  '(progn
     (package-initialize)
     (pyvenv-activate "~/.emacs.d/pyenv/")
     (elpy-enable)))

;; etags-table
(require 'etags-table)
(setq etags-table-search-up-depth 5)

;; ispell
(setq ispell-dictionary "english")

;; cc mode setup, 默认使用linux c风格，缩进8
(setq
 c-default-style "linux"
 c-basic-offset 8)

;; python mode
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args "--colors=NoColor"
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
(defun electric-indent-ignore-python (char)
  "Ignore electric indentation for python-mode"
  (if (equal major-mode 'python-mode)
      `no-indent'
    nil))
(add-hook 'electric-indent-functions 'electric-indent-ignore-python)

;; color theme load and setup
(ignore-errors
  (require 'color-theme)
  (color-theme-initialize)
  (color-theme-clarity))

;; dictionary setup, use dictionary-el, not dict in emacs-goodies-el
(setq dictionary-server "localhost")

;; desktop load and setup
(require 'desktop)
(desktop-save-mode)

;; golang mode autoload
(autoload 'go-mode "go-mode" "Major mode for editing Go source text." t)
(eval-after-load "go-mode"
  '(progn
     (setq gofmt-command "goimports")
     (add-hook 'before-save-hook 'gofmt-before-save)
     (require 'go-autocomplete)
     (require 'auto-complete-config)
     (require 'go-errcheck)
     (require 'go-guru)
     (add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)))

;; yasnippet load and setup
;; (eval-after-load "yasnippet"
(ignore-errors
  (require 'yasnippet)
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-global-mode 1))

;; multi-term autoload
(autoload 'multi-term "multi-term" "multi terminal" t)
(autoload 'multi-term-dedicated-open "multi-term" "multi terminal" t)
(setq
 multi-term-dedicated-select-after-open-p t
 multi-term-switch-after-close t)
(custom-set-variables
 '(term-default-bg-color "#000000")
 '(term-default-fg-color "#ffffff"))

;; template load and setup
(ignore-errors
  (require 'template)
  (setq template-subdirectories '("./" "Templates/" "~/.emacs.d/templates/"))
  (template-initialize)
  (setq template-auto-insert t))

;; setup tramp
(eval-after-load "tramp"
  '(progn
     (delete "LC_ALL=C" tramp-remote-process-environment)
     (add-to-list 'tramp-remote-process-environment "LC_ALL=zh_CN.utf8")
     (set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))))

;; uniquify load and setup
(ignore-errors
  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward))

;; setup auto-mode-alist
(add-to-list 'auto-mode-alist (cons "\\.go$" 'go-mode))
(add-to-list 'auto-mode-alist (cons "\\.md$" 'markdown-mode))
(add-to-list 'auto-mode-alist (cons "\\.rst$" 'rst-mode))
(add-to-list 'auto-mode-alist (cons "\\.rest$" 'rst-mode))

;;; setup.el ends here
