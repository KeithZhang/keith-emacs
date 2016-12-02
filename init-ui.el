;; 禁止显示工具栏
(tool-bar-mode -1)

;; 禁止显示滚动条
(scroll-bar-mode -1)

;; 鼠标显示类型为bar类型
(setq-default cursor-type 'bar)

;; emacs打开后全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(provide 'init-ui)
