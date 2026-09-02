;;; mac.el --- -*- lexical-binding: t; -*-
(server-start)

;; Emacs 31 can use lexical binding for files that do not choose a dialect.
(set-default-toplevel-value 'lexical-binding t)
(require 'warnings)
(add-to-list 'warning-suppress-types '(files missing-lexbind-cookie))
(add-to-list 'warning-suppress-log-types '(files missing-lexbind-cookie))

(set-frame-font "Monaco-15") ;; setup font size
(add-to-list 'default-frame-alist '(font .  "Monaco-15")) ;; for multi frame

;; default Latin font (e.g. Consolas)
(set-face-attribute 'default nil :family "Monaco")

(set-frame-parameter nil 'ns-appearance 'dark)

;; default font size (point * 10)
;;
;; WARNING!  Depending on the default font,
;; if the size is not supported very well, the frame will be clipped
;; so that the beginning of the buffer may not be visible correctly. 
(set-face-attribute 'default nil :height 140)

(eval-after-load "diredful"
  '(diredful-settings-load))

(setenv "PATH"
	"/opt/homebrew/opt/coreutils/libexec/gnubin:/Users/shell/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin")
(setq exec-path
      (append '("/opt/homebrew/opt/coreutils/libexec/gnubin"
		"/Users/shell/bin" "/usr/local/sbin" "/usr/local/bin")
	      exec-path))

(setenv "GOPATH" "/Users/shell/")

;;; mac.el ends here
