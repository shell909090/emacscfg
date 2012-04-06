(tool-bar-mode -1);; remove tool bar

(server-start)

(custom-set-variables '(column-number-mode t) '(show-paren-mode t))

(custom-set-faces
 '(default
    ((t (:inherit nil :stipple nil :background "SystemWindow"
		  :foreground "SystemWindowText" :inverse-video nil
		  :box nil :strike-through nil :overline nil :underline nil
		  :slant normal :weight normal :height 105 :width normal
		  :foundry "outline" :family "Courier New")))))

(setq popup-terminal-command '("cmd" "/c" "start"))
