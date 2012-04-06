;; self define functions
(defun switch-windows-buffer ()
  (interactive)
  (let ((this-buffer (window-buffer)))
    (switch-to-buffer (window-buffer (next-window (selected-window))))
    (switch-to-buffer-other-window this-buffer)
    (other-window 1)
    )
)

(defun popup-term ()
  (interactive)
  (apply 'start-process "terminal" nil popup-terminal-command)
  )

(defun gen-etags-tables ()
  (interactive)
  (let ((etags-path (expand-file-name (read-directory-name "etags path:")))
	(python-command (expand-file-name "~/.emacs.d/gen_etags.py")))
    (call-process "python" nil t nil python-command etags-path
		  (buffer-file-name (current-buffer)))))

(defun dired-etags-tables ()
  (interactive)
  (let ((etags-path (expand-file-name (read-directory-name "etags path:")))
	(python-command (expand-file-name "~/.emacs.d/gen_etags.py")))
    (call-process "python" nil t nil python-command etags-path)))

;; dired
;; Another way of achieving this:

;; we want dired not not make always a new buffer if visiting a directory
;; but using only one dired buffer for all directories.
(defadvice dired-find-file (around dired-subst-directory activate)
  "Replace current buffer if file is a directory."
  (interactive)
  (let ((orig (current-buffer))
	(filename (dired-get-filename)))
    ad-do-it
    (when (and (file-directory-p filename)
	       (not (eq (current-buffer) orig)))
      (kill-buffer orig))))

(eval-after-load "dired"
  ;; don't remove `other-window', the caller expects it to be there
  '(defun dired-up-directory (&optional other-window)
     "Run Dired on parent directory of current directory."
     (interactive "P")
     (let* ((dir (dired-current-directory))
     	    (orig (current-buffer))
     	    (up (file-name-directory (directory-file-name dir))))
       (or (dired-goto-file (directory-file-name dir))
     	   ;; Only try dired-goto-subdir if buffer has more than one dir.
     	   (and (cdr dired-subdir-alist)
     		(dired-goto-subdir up))
     	   (progn
     	     (kill-buffer orig)
     	     (dired up)
     	     (dired-goto-file dir))))))

(defun dired-guess-cmd (filename)
  (cond ((memq system-type '(windows-nt cygwin)) "start")
	(t "xdg-open")))

(defun dired-open-file (&optional arg)
  (interactive)
  (apply 'start-process "dired-open" nil
	 (append (split-string
		  (read-shell-command
		   "command: " (dired-guess-cmd (dired-get-filename))))
	  (list (dired-get-filename)))))

(defun dired-copy-from (&optional arg)
  (interactive)
  (let ((source-path (read-file-name "filepath: ")))
    (copy-file source-path (file-name-nondirectory source-path))))

(defun dired-rename-from (&optional arg)
  (interactive)
  (let ((source-path (read-file-name "filepath: ")))
    (rename-file source-path (file-name-nondirectory source-path))))

(add-hook 'dired-mode-hook
	  (lambda ()
	    (define-key dired-mode-map "b" 'dired-open-file)
	    (define-key dired-mode-map "c" 'dired-copy-from)
	    (define-key dired-mode-map "r" 'dired-rename-from)
	    (define-key dired-mode-map [(control c) (g)] 'dired-etags-tables)
	    ))

;; tabbar mode
(setq tabbar-buffer-groups-function
      (lambda () (list "All Buffers")))

(setq tabbar-buffer-list-function
      (lambda ()
        (remove-if
	 (lambda(buffer)
	   (find (aref (buffer-name buffer) 0) " *"))
	 (buffer-list))))