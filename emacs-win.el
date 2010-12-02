(tool-bar-mode -1);; remove tool bar
(menu-bar-mode -1);; remove menu bar

(server-start);; use for multi-file open in same window, look like have some problem

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(show-paren-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "SystemWindow"
			 :foreground "SystemWindowText" :inverse-video nil
			 :box nil :strike-through nil :overline nil :underline nil
			 :slant normal :weight normal :height 105 :width normal
			 :foundry "outline" :family "Courier New")))
    )
 )

(setq popup-terminal-command '("cmd" "/c" "start"))
