;;; win.el --- 
(server-start)

;; maximize
(run-with-idle-timer 1 nil 'w32-send-sys-command 61488)

;; Setting English Font
(set-face-attribute
  'default nil :font "Consolas 12")
 
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Microsoft Yahei" :size 15)))

;;; win.el ends here
