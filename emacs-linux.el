;;; emacs-linux.el --- 
(server-start)

;; maximize
(x-send-client-message
 nil 0 nil "_NET_WM_STATE" 32
 '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
(x-send-client-message
 nil 0 nil "_NET_WM_STATE" 32
 '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0))

(set-frame-font "monospace-10")
(set-fontset-font
 "fontset-default" 'unicode
 (font-spec :family "WenQuanYi Zen Hei" :registry "unicode-bmp"))

(setq popup-terminal-command '("x-terminal-emulator"))
