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
;; (global-set-key [(meta \])] 'tabbar-forward)
;; (global-set-key [(meta \[)] 'tabbar-backward)
;; (global-set-key [(meta \1)] (lambda () (interactive) (switch-tabbar 1)))
;; (global-set-key [(meta \2)] (lambda () (interactive) (switch-tabbar 2)))
;; (global-set-key [(meta \3)] (lambda () (interactive) (switch-tabbar 3)))
;; (global-set-key [(meta \4)] (lambda () (interactive) (switch-tabbar 4)))
;; (global-set-key [(meta \5)] (lambda () (interactive) (switch-tabbar 5)))
;; (global-set-key [(meta \6)] (lambda () (interactive) (switch-tabbar 6)))
;; (global-set-key [(meta \7)] (lambda () (interactive) (switch-tabbar 7)))
;; (global-set-key [(meta \8)] (lambda () (interactive) (switch-tabbar 8)))
;; (global-set-key [(meta \9)] (lambda () (interactive) (switch-tabbar 9)))
;; (global-set-key [(meta \0)] (lambda () (interactive) (switch-tabbar -1)))
