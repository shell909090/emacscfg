;;; emacs.el ---
;; .emacs profile, written by shell.xu

;; load other set
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/plugins/")
(package-initialize)
(load "userfunc")
(load "setup")
(load "dired-conf")
(load "keymap")
(cond
 ((memq system-type '(gnu/linux))
  (load "linux"))
 ((memq system-type '(darwin))
  (load "mac"))
 ((memq system-type '(windows-nt cygwin))
  (load "win")))
(if (file-exists-p "~/.emacs.d/lisp/locals.el")
    (load "locals"))

;;; emacs.el ends here
