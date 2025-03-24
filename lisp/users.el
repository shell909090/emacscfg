;;; users.el --- 

;; mine functions
(defun switch-windows-buffer ()
  (interactive)
  (let ((this-buffer (window-buffer)))
    (switch-to-buffer (window-buffer (next-window (selected-window))))
    (switch-to-buffer-other-window this-buffer)
    (other-window 1)))

(defun run-ask-ollama ()
  (interactive)
  (let ((background (buffer-string))
	(question (read-from-minibuffer "What's your question? "))
	(buff (get-buffer-create "ollama")))
    (start-process "ollama" buff "ask_ollama.py" "-e" "http://192.168.37.20:11434" "-m" "deepseek-r1:14b" "-fi" question)
    (process-send-string "ollama" background)
    (process-send-eof "ollama")
    (switch-to-buffer buff)))

(defun compile-to-other ()
  (interactive)
  (call-interactively 'compile)
  (other-window 1))

(defun kill-other-buffer ()
  (interactive)
  (kill-buffer (window-buffer (next-window (selected-window)))))

(defun revert-buffer-noask ()
  (interactive)
  (revert-buffer nil 't))

(defvar popup-terminal-command
  (cond ((memq system-type '(windows-nt cygwin))
	 '("cmd" "/c" "start"))
	((memq system-type '(darwin))
	 '("open" "-a" "iTerm" "."))
	((memq system-type '(gnu/linux))
	 '("sh" "-c" "terminator --new-tab --working-directory=`pwd`"))))
(defun popup-term ()
  (interactive)
  (apply 'start-process "terminal" nil popup-terminal-command))

;; system keymap
(global-unset-key [?\C- ])
(global-set-key [f7] 'switch-windows-buffer)
(global-set-key [f8] 'ein:notebooklist-open)
(global-set-key "\M-/" 'hippie-expand)
(global-set-key "\C-x\C-b" 'ibuffer)
;; kill *this* buffer with no question
(global-set-key (kbd "C-x k")
		(lambda ()
		  (interactive)
		  (kill-buffer (buffer-name))))
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;; global keymap
(global-set-key [(control tab)] 'other-window);; same as C-x o
(global-set-key (kbd "C-'") 'other-window);; same as C-x o
(global-set-key (kbd "M-2") 'set-mark-command);; same as C-@
(global-set-key (kbd "M-4") 'ispell-complete-word)
(global-set-key (kbd "M-]") (lambda () (interactive) (scroll-up 2)))
(global-set-key (kbd "M-[") (lambda () (interactive) (scroll-down 2)))

;; global function keymap
(global-set-key "\C-ca" 'python-shell)
(global-set-key "\C-cb" 'speedbar)
(global-set-key "\C-cd" 'dictionary-search)
(global-set-key "\C-ce" 'multi-term)
(global-set-key "\C-cf" 'grep-find)
(global-set-key "\C-ci" 'ispell-buffer)
(global-set-key "\C-ck" 'kill-other-buffer)
(global-set-key "\C-cl" 'align)
(global-set-key "\C-cm" 'man)
(global-set-key "\C-co" 'ispell-continue)
(global-set-key "\C-cr" 'revert-buffer-noask)
(global-set-key "\C-cs" 'popup-term)
(global-set-key "\C-cv" 'visit-tags-table);; just load
(global-set-key "\C-cw" 'compile-to-other)
(global-set-key "\C-cx" 'multi-term-dedicated-open)
(global-set-key "\C-c:" 'ispell-region)

;; multi-term mode keymap
(add-hook 'term-mode-hook
  (lambda ()
    (message "abc")
    (define-key term-raw-map "\C-c\C-j" 'term-line-mode)
    (define-key term-raw-map "\C-c\C-k" 'term-line-mode)))

;;; users.el ends here
