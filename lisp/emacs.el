;;; emacs.el ---
;; .emacs profile, written by shell.xu

;; load other set
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/plugins/")
(package-initialize)
(load "setup")
(load "plugins")
(load "users")
(load "dired-conf")
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(pkg-info popup jenkinsfile-mode dash auto-complete js2-mode color-theme-modern rust-mode with-editor csv-mode go-mode yaml-mode yasnippet kubernetes multi-term markdown-mode magit helm go-guru go-errcheck go-autocomplete flycheck epl elpy ein diredful dictionary color-theme))
 '(template-use-package t nil (template))
 '(term-default-bg-color "#000000")
 '(term-default-fg-color "#ffffff"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
