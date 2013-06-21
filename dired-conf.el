;;; dired-conf.el --- 

;; dired-x load and setup
(ignore-errors
  (require 'dired-x)
  (setq-default dired-omit-files-p t)
  (setq dired-omit-files "^\\.?#\\|^\\.[^\\.]+"))

(ignore-errors
  (setq diredful-init-file "~/.emacs.d/diredful-conf")
  (require 'diredful))

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

(defun dired-up-directory (&optional other-window)
  "Run Dired on parent directory of current directory."
  (interactive "P")
  (let* ((dir (dired-current-directory))
	 (orig (current-buffer))
	 (up (file-name-directory (directory-file-name dir))))
    (or (dired-goto-file (directory-file-name dir))
	;; Only try dired-goto-subdir if buffer has more than one dir.
	(and (cdr dired-subdir-alist) (dired-goto-subdir up))
	(progn
	  (kill-buffer orig)
	  (dired up)
	  (dired-goto-file dir)))))

;; operation enhanced
(defvar *etags-ext-list* `("c", "cpp", "cxx", "h", "hpp", "py", "java"))
(eval-after-load "dired"
  '(ignore-errors

     (defun update-etags-tables (dirname)
       (interactive (list (read-directory-name "etags path:")))
       (let ((tagfile (expand-file-name (concat dirname "TAGS"))))
	 (defun file-handler (filename)
	   (if (member (file-name-extension filename) *etags-ext-list*)
	       (call-process "etags" nil t nil filename "-a" "-o" tagfile)))
	 (defun traverse-directory (file)
	   (if (file-directory-p file)
	       (mapcar 'traverse-directory (directory-files file t "^[^.]"))
	     (file-handler file)))
	 (ignore-errors (delete-file tagfile))
	 (traverse-directory dirname)))

     (defun dired-copy-dir-as-kill (&optional arg)
       (interactive)
       (x-set-selection 'PRIMARY (dired-current-directory))
       (x-set-selection 'CLIPBOARD (dired-current-directory)))

     (defun dired-open-file (with-prog &optional arg)
       (interactive
	(list (read-shell-command
	       "command: "
	       (cond ((memq system-type '(windows-nt cygwin)) "start")
		     (t "xdg-open")))))
       (apply 'start-process "dired-open" nil
	      (append (split-string with-prog) (list (dired-get-filename)))))

     (define-key dired-mode-map "E" 'update-etags-tables)
     (define-key dired-mode-map "W" 'dired-copy-dir-as-kill)
     (define-key dired-mode-map "b" 'dired-open-file)))

;; ediff in dired
(eval-after-load "dired"
  '(ignore-errors

     (defun ediff-other ()
       (interactive)
       (let ((da (dired-get-filename))
	     (this (selected-window)))
	 (select-window (next-window this))
	 (ediff da (dired-get-filename))
	 (select-window this)))

     (define-key dired-mode-map "=" 'ediff)
     (define-key dired-mode-map "%=" 'ediff-other)))

;; copy/move enhanced
(eval-after-load "dired"
  '(ignore-errors

     (defmacro dired-common-form (funcname do-function)
       `(defun ,funcname (source-path &optional arg)
	  (interactive (list (read-file-name "filepath: ")))
	  (,do-function source-path (file-name-nondirectory source-path))
	  (revert-buffer)))

     (defmacro dired-common-to-other (funcname do-function)
       `(defun ,funcname (&optional arg)
	  (interactive)
	  (let ((marked (dired-get-marked-files nil arg))
		(other (next-window (selected-window)))
		(this (selected-window)))
	    (select-window other)
	    (let ((target (dired-current-directory)))
	      (mapcar
	       (lambda (source-path) (,do-function source-path target))
	       marked))
	    (revert-buffer)
	    (select-window this)
	    (revert-buffer))))

     (defun async-copy-file (source-path target)
       (apply 'start-process "copy-file" nil
	      (list "cp" "-a" source-path target)))

     (defun async-rename-file (source-path target)
       (apply 'start-process "copy-file" nil
	      (list "mv" source-path target)))

     (define-key dired-mode-map "c"
       (dired-common-to-other dired-copy-to-other copy-file))
     (define-key dired-mode-map "r"
       (dired-common-to-other dired-rename-to-other rename-file))
     (define-key dired-mode-map "\\c"
       (dired-common-to-other dired-async-copy-to-other async-copy-file))
     (define-key dired-mode-map "\\r"
       (dired-common-to-other dired-async-rename-to-other async-rename-file))
     (define-key dired-mode-map "%c"
       (dired-common-form dired-copy-from copy-file))
     (define-key dired-mode-map "%r"
       (dired-common-form dired-rename-from rename-file))))

;; mount/umount sshfs
(eval-after-load "dired"
  '(ignore-errors

     (defun umount-sshfs (&optional arg)
       (interactive)
       (let ((marked (dired-get-marked-files nil arg)))
	 (mapcar
	  (lambda (mountpoint)
	    (call-process "fusermount" nil nil nil "-u" mountpoint)
	    (delete-directory mountpoint))
	  marked))
       (revert-buffer))

     (defun mount-sshfs (sshurl mountpoint)
       (interactive "ssshurl: \nsmountpoint: ")
       (let ((real-mount-point
	      (expand-file-name (format "./%s" mountpoint))))
	 (ignore-errors (make-directory real-mount-point))
	 (call-process "sshfs" nil nil nil sshurl real-mount-point))
       (revert-buffer))

     (define-key dired-mode-map "\\h" 'mount-sshfs)
     (define-key dired-mode-map "\\u" 'umount-sshfs)))

;; rename filename enhanced
(defvar *tagregexp* "(.*?)\\|\\[.*?\\]\\|【.*?】")
(eval-after-load "dired"
  '(ignore-errors

     (defmacro dired-common-rename-marked (funcname rename-func)
       `(defun ,funcname (&optional arg)
	  (interactive)
	  (map-y-or-n-p
	   (lambda (filepath)
	     (let* ((filename (file-name-nondirectory filepath))
		    (newname (,rename-func filename)))
	       (if (and newname (not (string= newname filename)))
		   (format "rename %s => %s?" filename newname))))
	   (lambda (filepath)
	     (let* ((filename (file-name-nondirectory filepath))
		    (filedir (file-name-directory filepath))
		    (newname (,rename-func filename)))
	       (if (and newname (not (string= newname filename)))
		   (rename-file filepath (concat filedir newname)))))
	   (dired-get-marked-files nil arg))
	  (revert-buffer)))

     (defun replace-regexp-in-string-count (regexp rep string repeat)
       (with-temp-buffer
	 (insert string)
	 (beginning-of-buffer)
	 (dotimes (i repeat)
	   (if (not (re-search-forward regexp nil t)) (return nil))
	   (cond
	    ((char-or-string-p rep) (replace-match rep))
	    ((functionp rep) (replace-match (funcall rep (match-string 0))))))
	 (buffer-string)))

     (defun lterm-string (str)
       (replace-regexp-in-string "^[[:space:]]*" "" str))

     (defun detag-filename (filename)
       (lterm-string
	(replace-regexp-in-string-count *tagregexp* "" filename 1)))

     (defun untag-filename (filename)
       (replace-regexp-in-string-count
	*tagregexp*
	(lambda (matched)
	  (if (= (match-beginning 0) 1)
	      (substring matched 1 -1)
	    (concat "_" (substring matched 1 -1))))
	filename 1))

     (define-key dired-mode-map "\\d"
       (dired-common-rename-marked dired-detag-filename detag-filename))
     (define-key dired-mode-map "\\t"
       (dired-common-rename-marked dired-lterm-string lterm-string))
     (define-key dired-mode-map "\\w"
       (dired-common-rename-marked dired-untag-filename untag-filename))))

;; magit, work for git, in dired mode keymap
(eval-after-load "dired"
  '(ignore-errors
     (require 'magit)
     (define-key dired-mode-map "\\f" 'magit-fetch)
     (define-key dired-mode-map "\\l" 'magit-log)
     (define-key dired-mode-map "\\p" 'magit-pull)
     (define-key dired-mode-map "\\n" 'magit-push)
     (define-key dired-mode-map "\\s" 'magit-status)))

;; markdown files in dired
(eval-after-load "dired"
  '(ignore-errors
     (defun markdown-file (&optional arg)
       (interactive)
       (mapcar
	(lambda (source-path)
	  (if (string= (file-name-extension source-path) "md")
	      (apply
	       'start-process-shell-command "markdown" nil
	       (list
		"markdown" source-path ">"
		(concat (file-name-sans-extension source-path) ".html")))
	    ))
	(dired-get-marked-files nil arg))
       (revert-buffer))
     (define-key dired-mode-map "\\m" 'markdown-file)))

;;; dired-conf.el ends here
