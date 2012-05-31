;;; userfunc.el --- 
;; self define functions
(defun switch-windows-buffer ()
  (interactive)
  (let ((this-buffer (window-buffer)))
    (switch-to-buffer (window-buffer (next-window (selected-window))))
    (switch-to-buffer-other-window this-buffer)
    (other-window 1)
    )
)

(defvar popup-terminal-command nil)
(defun popup-term ()
  (interactive)
  (apply 'start-process "terminal" nil popup-terminal-command))

(defvar *etags-ext-list* `("c", "cpp", "cxx", "h", "hpp", "py", "java"))
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

;; (setq url-proxy-services '(("http" . "localhost:3128")))

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

(defun dired-open-file (with-prog &optional arg)
  (interactive
   (list (read-shell-command
	  "command: "
	  (cond ((memq system-type '(windows-nt cygwin)) "start")
		(t "xdg-open")))))
  (apply 'start-process "dired-open" nil
	 (append (split-string with-prog) (list (dired-get-filename)))))

(defmacro dired-common-form (do-function)
  `(lambda (source-path &optional arg)
     (interactive (list (read-file-name "filepath: ")))
     (,do-function source-path (file-name-nondirectory source-path))
     (revert-buffer)))

(defmacro dired-common-to-other (do-function)
  `(lambda (&optional arg)
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
       (select-window this))))

(defun dired-copy-dir-as-kill (&optional arg)
  (interactive)
  (x-set-selection 'PRIMARY (dired-current-directory))
  (x-set-selection 'CLIPBOARD (dired-current-directory)))

(defun dired-untag-file (&optional arg)
  (interactive)
  (defun untag-one (filename)
    (if (string-match "^(.*?)\\|^\\[.*?\\]" filename)
	(substring filename (match-end 0)) nil))
  (defun untag-file (filename)
    (let ((newname (untag-one (file-name-nondirectory filename))))
      (if newname
	  (rename-file
	   filename
	   (concat (file-name-directory filename) newname)))))
  (mapcar 'untag-file (dired-get-marked-files nil arg))
  (revert-buffer))

(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map "b" 'dired-open-file)
     (define-key dired-mode-map "c" (dired-common-to-other copy-file))
     (define-key dired-mode-map "r" (dired-common-to-other rename-file))
     (define-key dired-mode-map "%c" (dired-common-form copy-file))
     (define-key dired-mode-map "%r" (dired-common-form rename-file))
     (define-key dired-mode-map "W" 'dired-copy-dir-as-kill)
     (define-key dired-mode-map "\\t" 'dired-untag-file)))

;; bookmark mode
(eval-after-load "bookmark"
  '(progn
     (define-key bookmark-bmenu-mode-map "c" 'bookmark-bmenu-edit-annotation)
     (define-key bookmark-bmenu-mode-map "e" 'bookmark-bmenu-select)))