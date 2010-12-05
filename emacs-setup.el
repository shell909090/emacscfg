;; show
(setq inhibit-startup-screen t);; close welcome screen
(setq column-number-mode t);; enable column mode
(show-paren-mode t);; 显示匹配括号
(setq show-paren-style 'parentheses);; 显示匹配括号
(setq visible-bell t)
(setq frame-title-format "%b");; set title
(auto-image-file-mode);; enable image view
(menu-bar-mode -1);; remove menu bar
;; it's said that it can control buffer's name, but look like not work
(setq uniquify-buffer-name-style 'forward)

;; backup
;; small-temporary-file-directory
(setq version-control t)
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq backup-directory-alist
      (list (cons "." (concat temporary-file-directory "backup"))))

;; others
(setq default-major-mode 'text-mode);; set default mode
(auto-compression-mode 1);; set compression mode
(pc-selection-mode);; use shift + [array] to select
(put 'dired-find-alternate-file 'disabled nil)
(transient-mark-mode t);; unknown
(fset 'yes-or-no-p 'y-or-n-p);; use y/n to anwser
;; 在行首 C-k 时，同时删除该行
(setq-default kill-whole-line t)
(global-unset-key [?\C- ])
;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)
;; 默认建立文件使用unix格式，utf-8编码
(setq default-buffer-file-coding-system 'utf-8-unix)

;; 默认打开abbrev模式，不提示自动保存
(setq-default abbrev-mode t)
(setq save-abbrevs nil)

;; python模式
(setq python-indent 8)

;; cc-mode，默认使用linux c风格，缩进8
(setq c-default-style "linux" c-basic-offset 8)
