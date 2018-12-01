;;; linux.el --- 
(server-start)

;; maximize
(if (and (boundp 'initial-window-system)
	 (memq initial-window-system '(x w32)))
    (progn
      (x-send-client-message
       nil 0 nil "_NET_WM_STATE" 32
       '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
      (x-send-client-message
       nil 0 nil "_NET_WM_STATE" 32
       '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0))))

(set-frame-font "Noto Sans Mono CJK SC-14") ;; setup font size
(add-to-list 'default-frame-alist '(font .  "Noto Sans Mono CJK SC-14")) ;; for multi frame
(eval-after-load "diredful"
  '(diredful-settings-load))

;; environment setup
(setenv "PATH"
	"/home/shell/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin")
(setq exec-path
      (append exec-path
	      '("/home/shell/bin" "/usr/local/sbin" "/usr/local/bin"
		"/usr/sbin" "/usr/bin" "/sbin" "/bin")))

;;; linux.el ends here
