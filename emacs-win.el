(tool-bar-mode -1);; remove tool bar

(server-start)

;; 默认启动最大化
(run-with-idle-timer 1 nil 'w32-send-sys-command 61488)

(custom-set-variables '(column-number-mode t) '(show-paren-mode t))

(custom-set-faces
 '(default
    ((t (:inherit nil :stipple nil :background "SystemWindow"
		  :foreground "SystemWindowText" :inverse-video nil
		  :box nil :strike-through nil :overline nil :underline nil
		  :slant normal :weight normal :height 105 :width normal
		  :foundry "outline" :family "Courier New")))))

(setq popup-terminal-command '("cmd" "/c" "start"))
