;;; mac.el --- 
(server-start)

(set-frame-font "Noto Sans Mono CJK SC-14") ;; setup font size
(add-to-list 'default-frame-alist '(font .  "Noto Sans Mono CJK SC-14")) ;; for multi frame
(eval-after-load "diredful"
  '(diredful-settings-load))

;;; linux.el ends here
