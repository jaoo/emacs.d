(require-package 'fill-column-indicator)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)
(defun turn-on-fci-mode () (fci-mode 1))
(defun turn-off-fci-mode () (fci-mode -1))

(setq fci-rule-column 80)

(provide 'init-fill-column-indicator)
