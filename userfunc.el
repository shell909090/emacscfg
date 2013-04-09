;;; userfunc.el --- 

;; mine functions
(defun switch-windows-buffer ()
  (interactive)
  (let ((this-buffer (window-buffer)))
    (switch-to-buffer (window-buffer (next-window (selected-window))))
    (switch-to-buffer-other-window this-buffer)
    (other-window 1)))

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
	(t '("x-terminal-emulator"))))
(defun popup-term ()
  (interactive)
  (apply 'start-process "terminal" nil popup-terminal-command))

(defun open-url-with-w3m (url)
  (if (one-window-p)
      (split-window-horizontally))
  (other-window 1)
  (w3m-goto-url url))

(defvar lookup-dictcn-cache '())
(defun lookup-dictcn (term)
  (interactive
   (list (completing-read
	  "Search: " lookup-dictcn-cache
	  nil nil (thing-at-point 'word))))
  (open-url-with-w3m
   (concat "http://3g.dict.cn/s.php?q="
	   (w3m-url-encode-string term 'utf-8))))

;;; userfunc.el ends here
