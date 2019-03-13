(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
(global-linum-mode t)
(global-hl-line-mode 1)
(setq column-number-mode t)
(setq inhibit-splash-screen t)
(setq show-trailing-whitespace t)
(show-paren-mode 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(set-face-attribute 'default nil :font "Menlo-11")

(provide 'init-misc)
