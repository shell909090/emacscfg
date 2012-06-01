;; .emacs profile, written by shell.xu

;; load other set
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins/")
(load "setup")
(load "plugins")
(load "userfunc")
(load "mydired")
(load "keymap")
(cond
 ((memq system-type '(windows-nt cygwin))
  (load "emacs-win"))
 ((memq system-type '(gnu/linux))
  (if (and (boundp 'initial-window-system)
	   (memq initial-window-system '(x w32)))
      (load "emacs-linux")
    (load "emacs-console"))))
(if (file-exists-p "~/.emacs.d/locals.el")
    (load "locals"))