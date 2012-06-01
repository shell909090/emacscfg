;;; emacs.el ---
;; .emacs profile, written by shell.xu

;; load other set
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins/")
(load "setup")
(load "userfunc")
(load "keymap")
(cond
 ((memq system-type '(windows-nt cygwin))
  (load "emacs-win"))
 ((memq system-type '(gnu/linux))
  (load "emacs-linux")))
(if (file-exists-p "~/.emacs.d/locals.el")
    (load "locals"))

;;; emacs.el ends here