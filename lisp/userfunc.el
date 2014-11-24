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

;;; userfunc.el ends here
