(tool-bar-mode -1);; remove tool bar
(menu-bar-mode -1);; remove menu bar

(server-start)
(set-frame-font "DejaVu Sans Mono:pixelsize=15")
(set-fontset-font "fontset-default" 'unicode
		  '("AR PL UMing CN:pixelsize=15" . "unicode-bmp"))

(setq popup-terminal-command '("x-terminal-emulator"))
