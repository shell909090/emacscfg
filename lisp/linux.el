;;; linux.el --- 
(server-start)

(setq x-select-enable-clipboard t);; emacs selection to x clipboard

;; maximize
(set-frame-parameter nil 'fullscreen 'maximized)
;; (set-frame-parameter nil 'fullscreen 'fullboth)

;; (progn
;;   (x-send-client-message
;;    nil 0 nil "_NET_WM_STATE" 32
;;    '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
;;   (x-send-client-message
;;    nil 0 nil "_NET_WM_STATE" 32
;;    '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))

(set-frame-font "Noto Sans Mono CJK SC-14") ;; setup font size
(add-to-list 'default-frame-alist '(font .  "Noto Sans Mono CJK SC-14")) ;; for multi frame
(eval-after-load "diredful"
  '(diredful-settings-load))

;; environment setup
(setq exec-path
      (append exec-path
	      '("/home/shell/bin" "/usr/local/sbin" "/usr/local/bin"
		"/usr/sbin" "/usr/bin" "/sbin" "/bin")))
(setenv "PATH"
	"/home/shell/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin")
(setenv "GOPATH" "/home/shell/")
(setenv "GOROOT" "/home/shell/usr/go")

;;; linux.el ends here
