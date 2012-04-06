;;; keymap.el --- 
;;; define keymap

(global-set-key [f4] 'speedbar)
(global-set-key [f5] 'ibuffer)
(global-set-key [f6] 'bookmark-bmenu-list)
(global-set-key [f7] 'switch-windows-buffer)

(global-set-key [(meta /)] 'hippie-expand)
(global-set-key [(control ?;)] 'comment-or-uncomment-region)
(global-set-key [(control x) (control b)] 'ibuffer)
(global-set-key [(control x) (k)] 'kill-this-buffer);; kill *this* buffer with no question
(global-set-key [(control tab)] 'other-window);; same as C-x o

(global-set-key [(control c) (a)] 'abbrev-mode)
(global-set-key [(control c) (c)] 'auto-complete-mode)
(global-set-key [(control c) (d)] 'dictionary-search)
(global-set-key [(control c) (e)] 'multi-term)
(global-set-key [(control c) (f)] 'grep-find)
(global-set-key [(control c) (g)] 'gen-etags-tables)
(global-set-key [(control c) (l)] 'align)
(global-set-key [(control c) (m)] 'man)
(global-set-key [(control c) (r)] 'revert-buffer)
(global-set-key [(control c) (s)] 'popup-term)
(global-set-key [(control c) (t)] 'top)
(global-set-key [(control c) (v)] 'visit-tags-table);; just load
(global-set-key [(control c) (w)] 'compile)
(global-set-key [(control c) (x)] 'multi-term-dedicated-open)

;; for tabbar
(global-set-key [(meta \])] 'tabbar-forward)
(global-set-key [(meta \[)] 'tabbar-backward)
