;;; mac.el --- 
(server-start)

(set-frame-font "Monaco-16") ;; setup font size
(add-to-list 'default-frame-alist '(font .  "Monaco-16")) ;; for multi frame

;; default Latin font (e.g. Consolas)
(set-face-attribute 'default nil :family "Monaco")

;; default font size (point * 10)
;;
;; WARNING!  Depending on the default font,
;; if the size is not supported very well, the frame will be clipped
;; so that the beginning of the buffer may not be visible correctly. 
(set-face-attribute 'default nil :height 160)

(eval-after-load "diredful"
  '(diredful-settings-load))

(setenv "PATH"
	"/Users/shell/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin")
(setq exec-path
      (append exec-path
	      '("/Users/shell/bin" "/usr/local/sbin" "/usr/local/bin"
		"/usr/sbin" "/usr/bin" "/sbin" "/bin")))

(setenv "GOPATH" "/Users/shell/")

;;; mac.el ends here
