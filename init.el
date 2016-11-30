;; 禁止显示工具栏
(tool-bar-mode -1)

;; 禁止显示滚动条
(scroll-bar-mode -1)

;; 关闭启动画面
(setq inhibit-splash-screen t)

;; 鼠标显示类型为bar类型
(setq-default cursor-type 'bar)

;; 禁止生成备份文件，如:init.el~
(setq make-backup-files nil)

;; 显示行号
(global-linum-mode t)

;; 显示当前行
(global-hl-line-mode t)
 
;; 定义打开文件或者目录的方法
(defun open-my-init-file()
  (interactive)
  (find-file "~/project/mine/emacs/keith-emacs"))
;; 绑定F2快捷键
(global-set-key (kbd "<f2>") 'open-my-init-file)

;; 全局使用自动提示的功能
(global-company-mode t)

;; org文档中的代码显示高亮
(require 'org)
(setq org-src-fontify-natively t)

(require 'recentf)
(recentf-mode t)
;; 最近经常使用的文件最大的保存个数
(setq recentf-max-menu-items 20)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 选中文本后再输入新的文本后，不会追加文本而是替换文本
(delete-selection-mode t)

;; emacs打开后全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 增加钩子，当进入emacs-list的major mode时候，启用show-paren-mode，
;; 这个mode可以动态显示括号配对情况
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
