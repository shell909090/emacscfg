;;; emacs-win.el --- 
(server-start)

;; maximize
(run-with-idle-timer 1 nil 'w32-send-sys-command 61488)

(custom-set-faces
 '(default
    ((t (:inherit nil :stipple nil :background "SystemWindow"
		  :foreground "SystemWindowText" :inverse-video nil
		  :box nil :strike-through nil :overline nil :underline nil
		  :slant normal :weight normal :height 105 :width normal
		  :foundry "outline" :family "Courier New")))))

(setq popup-terminal-command '("cmd" "/c" "start"))
