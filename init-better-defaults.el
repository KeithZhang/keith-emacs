;; 禁止声音提示
(setq ring-bell-function 'ignore)

;; 显示行号
(global-linum-mode t)
;; 在js2-mode下才显示行号
;; (add-hook 'js2-mode-hook 'linum-mode)

;; 外部修改文件后，emacs重新加载
(global-auto-revert-mode t)

;; 禁止生成备份文件，如:init.el~
(setq make-backup-files nil)

;; 禁止auto-save
(setq auto-save-default nil)

;; 关闭启动画面
(setq inhibit-splash-screen t)

;; 最近打开的文件功能
(recentf-mode t)
;; 最近经常使用的文件最大的保存个数
(setq recentf-max-menu-items 20)

;; 自定义变量，一般是配置一些常用的变量但是又很难手动输入的
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; Microsoft
					    ("8mc" "Microsoft")
					    ))

;; 增加钩子，当进入emacs-list的major mode时候，启用show-paren-mode，
;; 这个mode可以动态显示括号配对情况
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 选中文本后再输入新的文本后，不会追加文本而是替换文本
(delete-selection-mode t)

;; 当系统是mac os的时候，启用exec-path-from-shell-initialize
;; 作用是本地装了node，在emacs中能调用到
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; 
(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  (interactive)
  (save-excursion
    ;; 如果选中文本
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

(provide 'init-better-defaults)
