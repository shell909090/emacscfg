;;; keymap.el --- 
;; define keymap

(global-unset-key [?\C- ])

(global-set-key [f4] 'speedbar)
(global-set-key [f5] 'ibuffer)
(global-set-key [f6] 'bookmark-bmenu-list)
(global-set-key [f7] 'switch-windows-buffer)

(global-set-key [(meta /)] 'hippie-expand)
(global-set-key [(control ?;)] 'comment-or-uncomment-region)
(global-set-key [(control x) (control b)] 'ibuffer)
(global-set-key "\C-xk" 'kill-this-buffer);; kill *this* buffer with no question
(global-set-key [(control tab)] 'other-window);; same as C-x o

(global-set-key "\C-cd" 'dictionary-search)
(global-set-key "\C-ce" 'multi-term)
(global-set-key "\C-cf" 'grep-find)
(global-set-key "\C-cl" 'align)
(global-set-key "\C-cm" 'man)
(global-set-key "\C-cp" 'pylookup-lookup)
(global-set-key "\C-cr" 'revert-buffer)
(global-set-key "\C-cs" 'popup-term)
(global-set-key "\C-ct" 'top)
(global-set-key "\C-cw" 'compile-to-other)
(global-set-key "\C-cx" 'multi-term-dedicated-open)

(global-set-key "\C-ccu" 'update-etags-tables)
(global-set-key "\C-ccv" 'visit-tags-table);; just load

;;; keymap.el ends here