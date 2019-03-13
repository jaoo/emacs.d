(require-package 'js2-mode)

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(after-load 'js2-mode
  (setq-default
   indent-tabs-mode nil
   js2-basic-offset 2
   js2-basic-indent-p 2
   js2-enter-indents-newline nil
   js2-indent-on-enter-key nil
   js2-bounce-indent-p nil))

(provide 'init-javascript)
