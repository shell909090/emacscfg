;;; dired-conf.el --- 

;; dired-x load and setup
(require 'dired-x)
(require 'diredful)
(setq-default dired-omit-files-p t)
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))
(setq dired-omit-files "^\\.?#\\|^\\.[^\\.]+")
;; fix dired with tramp can't open file issue
(setq dired-listing-switches "-alh --time-style long-iso")

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

(defun dired-copy-dir-as-kill (&optional arg)
  (interactive)
  (x-set-selection 'PRIMARY (dired-current-directory))
  (x-set-selection 'CLIPBOARD (dired-current-directory)))

(define-key dired-mode-map "W" 'dired-copy-dir-as-kill)

(defun dired-open-file (with-prog &optional arg)
  (interactive
   (list (read-shell-command
	  "command: "
	  (cond ((memq system-type '(windows-nt cygwin)) "start")
		((memq system-type '(darwin)) "open")
		((memq system-type '(gnu/linux)) "xdg-open")))))
  (apply 'start-process "dired-open" nil
	 (append (split-string with-prog) (list (dired-get-filename)))))

(define-key dired-mode-map "b" 'dired-open-file)

;; ediff in dired
(defun ediff-other ()
  (interactive)
  (let ((da (dired-get-filename))
	(this (selected-window)))
    (select-window (next-window this))
    (ediff da (dired-get-filename))
    (select-window this)))

(define-key dired-mode-map "=" 'ediff)
(define-key dired-mode-map "%=" 'ediff-other)

;; copy/move enhanced
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
  (dired-common-form dired-rename-from rename-file))

;; magit, work for git, in dired mode keymap
(eval-after-load "magit"
  '(progn
     (require 'magit)
     (define-key dired-mode-map "\\l" 'magit-log)
     (define-key dired-mode-map "\\s" 'magit-status)))

;;; dired-conf.el ends here
