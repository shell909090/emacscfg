;;; keymap.el --- 

;;; define keymap
(global-set-key [f4] 'speedbar)
(global-set-key [f5] 'ibuffer)
(global-set-key [C-f5] 'bookmark-bmenu-list);; list bookmark
(global-set-key [f6] 'shell);; open shell
(global-set-key [C-f6] 'run-python-cmd)
(global-set-key [f7] 'switch-windows-buffer)

(global-set-key "\M-/" 'hippie-expand)
(global-set-key [(control ?;)] 'comment-or-uncomment-region)
(global-set-key [(control x) (control b)] 'ibuffer)
(global-set-key [(control x) (k)] 'kill-this-buffer);; kill *this* buffer with no question
(global-set-key [(control tab)] 'other-window);; same as C-x o

(global-set-key [(control c) (a)] 'abbrev-mode)
(global-set-key [(control c) (c)] 'auto-complete-mode)
(global-set-key [(control c) (f)] 'grep-find)
(global-set-key [(control c) (g)] 'gen-etags-tables)
(global-set-key [(control c) (l)] 'align)
(global-set-key [(control c) (m)] 'man)
(global-set-key [(control c) (n)] 'msf-abbrev-define-new-abbrev-this-mode)
(global-set-key [(control c) (r)] 'revert-buffer)
(global-set-key [(control c) (s)] 'popup-term)
(global-set-key [(control c) (t)] 'top)
(global-set-key [(control c) (v)] 'visit-tags-table);; just load
