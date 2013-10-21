;;; keymap.el --- 
;; define keymap

;; system keymap
(global-unset-key [?\C- ])
(global-set-key [f7] 'switch-windows-buffer)
(global-set-key "\M-/" 'hippie-expand)
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key "\C-xk" 'kill-this-buffer);; kill *this* buffer with no question
(global-set-key "\C-c\C-k" 'kill-other-buffer)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;; global keymap
(global-set-key [(control tab)] 'other-window);; same as C-x o
(global-set-key (kbd "C-'") 'other-window);; same as C-x o
(global-set-key (kbd "M-2") 'set-mark-command);; same as C-@
(global-set-key (kbd "M-3") 'execute-extended-command);; same as M-x
(global-set-key (kbd "M-]") (lambda () (interactive) (scroll-up 2)))
(global-set-key (kbd "M-[") (lambda () (interactive) (scroll-down 2)))

;; global function keymap
(global-set-key "\C-ca" 'python-shell)
(global-set-key "\C-cc" 'lookup-dictcn)
(global-set-key "\C-cb" 'speedbar)
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

;; go mode keymap
(eval-after-load "go-mode"
  '(progn
     (define-key go-mode-map "\C-c\C-a" 'go-import-add)
     (define-key go-mode-map "\C-c\C-o" 'godoc)
     (define-key go-mode-map "\C-c\C-u" 'go-remove-unused-imports)))

;; python mode keymap
(eval-after-load "python"
  '(progn
     (define-key python-mode-map "\C-c\C-l" 'pylookup-lookup)
     (define-key python-mode-map "\C-c\C-d" 'python-describe-symbol)))

;;; keymap.el ends here
