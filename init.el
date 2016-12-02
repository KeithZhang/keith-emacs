;; 定义打开文件或者目录的方法
(defun open-my-init-file()
  (interactive)
  (find-file "~/project/mine/emacs/keith-emacs"))

(require 'init-packages)

(require 'init-ui)

(require 'init-better-defaults)

(require 'init-keybindings)

(require 'init-org)

;; emacs自动生成的配置
(setq custom-file (expand-file-name "custom.el" keith/dir))
(load-file custom-file)
