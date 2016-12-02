(require 'cl)

(when (>= emacs-major-version 24)
  ;; (require 'package)
  ;;(package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://elpa.zilongshanren.com/melpa/") t))

(defvar keith/packages '(company
			 monokai-theme
			 zenburn-theme
			 spacemacs-theme
			 hungry-delete
			 swiper
			 counsel
			 smartparens
			 js2-mode
			 nodejs-repl
			 exec-path-from-shell
			 popwin) "Default packages")

(setq package-selected-packages keith/packages)

(defun keith/packages-installed-p ()
  (loop for pkg in keith/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (keith/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg keith/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; 无用的空格可以一键删除，而不需要多次删除
(require 'hungry-delete)
(global-hungry-delete-mode t)

;; 自动补全括号功能
(require 'smartparens-config)
(smartparens-global-mode t)

;; swiper功能，搜索，查找文件等会在下方打开小窗口方便选择
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; 所有js文件使用js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; 全局使用自动提示的功能
(global-company-mode t)

;; 默认使用spacemacs主题配色
(load-theme 'spacemacs-dark t)

;; buffer会在底部出现而且光标会自动到底部窗口内，不需要经常切窗口
(require 'popwin)
(popwin-mode t)

;; 执行js的环境
(require 'nodejs-repl)

(provide 'init-packages)
