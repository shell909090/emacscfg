;;; emacs.el ---
;; .emacs profile, written by shell.xu

;; load other set
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/plugins/")
(load "setup")
(load "userfunc")
(load "dired-conf")
(load "keymap")
(cond
 ((memq system-type '(windows-nt cygwin))
  (load "win"))
 ((memq system-type '(gnu/linux))
  (load "linux")))
(if (file-exists-p "~/.emacs.d/lisp/locals.el")
    (load "locals"))

;;; emacs.el ends here
