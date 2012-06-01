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

;; bookmark mode
(eval-after-load "bookmark"
  '(progn
     (define-key bookmark-bmenu-mode-map "c" 'bookmark-bmenu-edit-annotation)
     (define-key bookmark-bmenu-mode-map "e" 'bookmark-bmenu-select)))