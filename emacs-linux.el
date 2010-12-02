(tool-bar-mode -1);; remove tool bar
(menu-bar-mode -1);; remove menu bar

(server-start);; use for multi-file open in same window, look like have some problem
(set-default-font "DejaVu Sans Mono:pixelsize=16")
(set-fontset-font "fontset-default"
		  'unicode 
		  '("AR PL UMing CN:pixelsize=16" . "unicode-bmp"))

(setq popup-terminal-command '("xfce4-terminal"))
