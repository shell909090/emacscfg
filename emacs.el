;; .emacs profile, written by shell.xu

;; load other set
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins/")
(load "emacs-setup")
(load "emacs-redef")
(load "emacs-plugin")
(cond
 ((memq system-type '(windows-nt cygwin)) (load "emacs-win"))
 ((memq system-type '(gnu/linux))
  (if (and (boundp 'initial-window-system) (memq initial-window-system '(x w32)))
      (load "emacs-linux")
    (load "emacs-console")
    )
  )
 )
(load "emacs-keymap")