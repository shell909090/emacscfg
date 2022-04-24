;;; plugins.el --- 

;; abbrev mode setup
(setq
 abbrev-mode t ;; abbrev auto
 save-abbrevs nil)

;; auto complete load and setup
(ignore-errors
  (require 'auto-complete)
  (global-auto-complete-mode t)
  (ac-config-default)
  (define-key ac-complete-mode-map "\C-n" 'ac-next)
  (define-key ac-complete-mode-map "\C-p" 'ac-previous))

;; bookmark mode setup, exchange c and e keybind
(eval-after-load "bookmark"
  '(progn
     (define-key bookmark-bmenu-mode-map "c" 'bookmark-bmenu-edit-annotation)
     (define-key bookmark-bmenu-mode-map "e" 'bookmark-bmenu-select)))

;; cc mode setup, 默认使用linux c风格，缩进8
(setq
 c-default-style "linux"
 c-basic-offset 8)

;; color theme load and setup
(ignore-errors
  (require 'color-theme-modern) ;; usage: https://github.com/emacs-jp/replace-colorthemes#activating-a-theme
  (load-theme 'clarity t t)
  (enable-theme 'clarity))

;; dictionary setup, use dictionary-el, not dict in emacs-goodies-el
(setq dictionary-server "localhost")

;; ediff mode
(setq ediff-split-window-function 'split-window-horizontally)

;; elpy
(eval-after-load "elpy"
  '(progn
     (pyvenv-activate "~/.emacs.d/pyenv/")
     (elpy-enable)))

;; etags-table
(require 'etags-table)
(setq etags-table-search-up-depth 5)

;; golang mode autoload
(autoload 'go-mode "go-mode" "Major mode for editing Go source text." t)
(add-to-list 'auto-mode-alist (cons "\\.go$" 'go-mode))
(eval-after-load "go-mode"
  '(progn
     (setq gofmt-command "goimports")
     (add-hook 'before-save-hook 'gofmt-before-save)
     (require 'go-autocomplete)
     (require 'auto-complete-config)
     (require 'go-errcheck)
     (require 'go-guru)
     (add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)
     (define-key go-mode-map "\C-c\C-p" 'godoc)
     (define-key go-mode-map "\C-c\C-r" 'go-errcheck)
     (speedbar-add-supported-extension ".go")))

;; ispell
(setq ispell-dictionary "english")

;; markdown autoload
(autoload 'markdown-mode "markdown-mode" "markdown mode" t)
(add-to-list 'auto-mode-alist (cons "\\.md$" 'markdown-mode))
(add-to-list 'auto-mode-alist (cons "\\.markdown$" 'markdown-mode))

;; multi-term autoload
(autoload 'multi-term "multi-term" "multi terminal" t)
(autoload 'multi-term-dedicated-open "multi-term" "multi terminal" t)
(setq
 multi-term-dedicated-select-after-open-p t
 multi-term-switch-after-close t)
(custom-set-variables
 '(term-default-bg-color "#000000")
 '(term-default-fg-color "#ffffff"))

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

;; python mode keymap
(eval-after-load "python"
  '(progn
     (define-key python-mode-map "\C-c\C-d" 'python-describe-symbol)))

;; rst-mode load and setup
(add-to-list 'auto-mode-alist (cons "\\.rst$" 'rst-mode))
(add-to-list 'auto-mode-alist (cons "\\.rest$" 'rst-mode))

;; template load and setup
(ignore-errors
  (require 'template)
  (setq template-subdirectories '("./" "Templates/" "~/.emacs.d/templates/"))
  (template-initialize)
  (setq template-auto-insert t))

;; tramp load and setup
(eval-after-load "tramp"
  '(progn
     (delete "LC_ALL=C" tramp-remote-process-environment)
     (add-to-list 'tramp-remote-process-environment "LC_ALL=zh_CN.utf8")
     (set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))))

;; uniquify load and setup
(ignore-errors
  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward))

;; yasnippet load and setup
(ignore-errors
  (require 'yasnippet)
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-global-mode 1))

;;; modes.el ends here
