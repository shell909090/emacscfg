;;; plugins.el --- 

;; abbrev mode setup
(setq
 abbrev-mode t ;; abbrev auto
 save-abbrevs nil)

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

;; corfu setup
(require 'corfu)
(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-prefix 2))

;; ediff mode
(setq ediff-split-window-function 'split-window-horizontally)

;; eglot setup
(require 'eglot)
(use-package eglot
  :ensure t
  :hook (python-mode . eglot-ensure) ; 进入 python-mode 自动启动 eglot
  :config
  ;; 提高补全响应速度
  (setq eglot-send-changes-idle-time 0.1))

;; elpy
(eval-after-load "elpy"
  '(progn
     (pyvenv-activate "~/.emacs.d/pyenv/")
     (elpy-enable)))

;; etags-table
(require 'etags-table)
(setq etags-table-search-up-depth 5)

;; gptel
(use-package gptel
  :ensure t
  :config
  (setq gptel-ollama-backend
        (gptel-make-ollama "ollama"
          :host "192.168.33.4:11434"
          :stream t
          :models '(qwen3:30b qwen3-coder:30b)))
  (setq-default gptel-backend gptel-ollama-backend
                gptel-model 'qwen3-coder:30b))

;; golang mode autoload
(autoload 'go-mode "go-mode" "Major mode for editing Go source text." t)
(add-to-list 'auto-mode-alist (cons "\\.go$" 'go-mode))
(eval-after-load "go-mode"
  '(progn
     (setq gofmt-command "goimports")
     (add-hook 'before-save-hook 'gofmt-before-save)
     ;; (require 'go-autocomplete)
     ;; (require 'auto-complete-config)
     (require 'go-errcheck)
     (require 'go-guru)
     (add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)
     (define-key go-mode-map "\C-c\C-p" 'godoc)
     (define-key go-mode-map "\C-c\C-r" 'go-errcheck)))
     ;; (speedbar-add-supported-extension ".go")))

;; ispell
(setq ispell-dictionary "english")

;; javascript mode
(setq js-indent-level 2)

;; markdown autoload
(autoload 'markdown-mode "markdown-mode" "markdown mode" t)
(add-to-list 'auto-mode-alist (cons "\\.md$" 'markdown-mode))
(add-to-list 'auto-mode-alist (cons "\\.markdown$" 'markdown-mode))

;; minuet setup
(use-package minuet
  :bind
  (("M-y" . #'minuet-complete-with-minibuffer) ;; use minibuffer for completion
   ("M-i" . #'minuet-show-suggestion) ;; use overlay for completion
   ("C-c m" . #'minuet-configure-provider)
   :map minuet-active-mode-map
   ;; These keymaps activate only when a minuet suggestion is displayed in the current buffer
   ("M-p" . #'minuet-previous-suggestion) ;; invoke completion or cycle to next completion
   ("M-n" . #'minuet-next-suggestion) ;; invoke completion or cycle to previous completion
   ("M-A" . #'minuet-accept-suggestion) ;; accept whole completion
   ;; Accept the first line of completion, or N lines with a numeric-prefix:
   ;; e.g. C-u 2 M-a will accepts 2 lines of completion.
   ("M-a" . #'minuet-accept-suggestion-line)
   ("M-e" . #'minuet-dismiss-suggestion))
  :init
  ;; if you want to enable auto suggestion.
  ;; Note that you can manually invoke completions without enable minuet-auto-suggestion-mode
  (add-hook 'prog-mode-hook #'minuet-auto-suggestion-mode)
  :config
  ;; You can use M-x minuet-configure-provider to interactively configure provider and model
  (setq minuet-provider 'openai-fim-compatible)
  (setq minuet-context-window 4096)
  (setq minuet-request-timeout 10)
  (plist-put minuet-openai-fim-compatible-options :end-point "http://192.168.33.4:11434/v1/completions")
  (plist-put minuet-openai-fim-compatible-options :name "Ollama")
  (plist-put minuet-openai-fim-compatible-options :api-key "TERM")
  (plist-put minuet-openai-fim-compatible-options :model "qwen3-coder:30b"))
(require 'minuet)

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

;; shell mode
(setq sh-indentation 2)

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
