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

(set-frame-font "WenQuanYi Zen Hei Mono-14") ;; setup font size
(add-to-list 'default-frame-alist '(font .  "WenQuanYi Zen Hei Mono-14")) ;; for multi frame
(diredful-settings-load)

;;; linux.el ends here
