(tool-bar-mode -1);; remove tool bar

(server-start)

;; maximize
(x-send-client-message
 nil 0 nil "_NET_WM_STATE" 32
 '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
(x-send-client-message
 nil 0 nil "_NET_WM_STATE" 32
 '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0))

(set-frame-font "monospace-10")
(set-fontset-font "fontset-default" 'unicode
		  '("AR PL UMing CN" . "unicode-bmp"))

(setq popup-terminal-command '("x-terminal-emulator"))
