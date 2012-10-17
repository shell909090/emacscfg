;;; keymap.el --- 
;; define keymap

;; system keymap
(global-unset-key [?\C- ])
;; (global-set-key [f4] 'speedbar)
(global-set-key [f7] 'switch-windows-buffer)
(global-set-key [(meta /)] 'hippie-expand)
(global-set-key [(control ?;)] 'comment-or-uncomment-region)
(global-set-key [(control x) (control b)] 'ibuffer)
(global-set-key "\C-xk" 'kill-this-buffer);; kill *this* buffer with no question
(global-set-key [(control tab)] 'other-window);; same as C-x o
(global-set-key (kbd "C-2") 'set-mark-command);; same as C-@

;; global keymap
(global-set-key "\C-c\C-k" 'kill-other-buffer)
(global-set-key "\C-ca" 'python-shell)
(global-set-key "\C-cd" 'dictionary-search)
(global-set-key "\C-ce" 'multi-term)
(global-set-key "\C-cf" 'grep-find)
(global-set-key "\C-cl" 'align)
(global-set-key "\C-cm" 'man)
(global-set-key "\C-cr" 'revert-buffer-noask)
(global-set-key "\C-cs" 'popup-term)
(global-set-key "\C-ct" 'top)
(global-set-key "\C-cv" 'visit-tags-table);; just load
(global-set-key "\C-cw" 'compile-to-other)
(global-set-key "\C-cx" 'multi-term-dedicated-open)

;; python mode keymap
(eval-after-load "python"
  '(progn
     (define-key python-mode-map "\C-c\C-l" 'pylookup-lookup)
     (define-key python-mode-map "\C-c\C-d" 'python-describe-symbol)))

;; dired mode keymap
(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map "E" 'update-etags-tables)
     (define-key dired-mode-map "W" 'dired-copy-dir-as-kill)
     (define-key dired-mode-map "b" 'dired-open-file)))

;; magit, work for git, in dired mode keymap
(eval-after-load "dired"
  '(ignore-errors
     (require 'magit)
     (define-key dired-mode-map "\\f" 'magit-fetch)
     (define-key dired-mode-map "\\l" 'magit-log)
     (define-key dired-mode-map "\\p" 'magit-pull)
     (define-key dired-mode-map "\\P" 'magit-push)
     (define-key dired-mode-map "\\s" 'magit-status)))

;;; keymap.el ends here