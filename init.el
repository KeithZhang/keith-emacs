(require 'init-packages)

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

;; 禁止auto-save
(setq auto-save-default nil)

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

;; org文档中的代码显示高亮
(require 'org)
(setq org-src-fontify-natively t)

;; 最近打开的文件功能
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

;; swaiper键盘绑定
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; 当系统是mac os的时候，启用exec-path-from-shell-initialize
;; 作用是本地装了node，在emacs中能调用到
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; 外部修改文件后，emacs重新加载
(global-auto-revert-mode t)

;; 自定义变量，一般是配置一些常用的变量但是又很难手动输入的
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; Microsoft
					    ("8mc" "Microsoft")
					    ))

;; 禁止声音提示
(setq ring-bell-function 'ignore)
