(tool-bar-mode -1);; remove tool bar

(server-start)
(set-frame-font "monospace-10")
(set-fontset-font "fontset-default" 'unicode
		  '("AR PL UMing CN" . "unicode-bmp"))

(setq popup-terminal-command '("x-terminal-emulator"))
