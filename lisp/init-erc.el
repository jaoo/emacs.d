(require-package 'erc-terminal-notifier)

(require 'erc)

;; I don't really care about when people join or leave, or other spam.
(erc-track-mode t)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                "324" "329" "332" "333" "353" "477"))
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

;; Have query buffers open automatically when someone sends a private message.
(setq erc-auto-query 'buffer)

;; Tell ERC where to save log files.
(setq erc-log-channels-directory "~/.erc/logs/")

(defun setup-localproxy()
  "Setup Emacs for using local SOCKS proxy for ERC"
  (interactive)

  (require 'socks)
  (setq socks-noproxy '("localhost"))
  (setq socks-override-functions 1)
  (setq erc-server-connect-function 'socks-open-network-stream)
  ;; ssh port number for dynamic forwarding
  (setq socks-server (list "SSH Local" "localhost" 24123 5))
  )

(defun unsetup-localproxy()
  "Unsetup Emacs for using local SOCKS proxy for ERC"
  (interactive)

  (require 'socks)
  (setq socks-noproxy nil)
  (setq socks-override-funcions nil)
  (setq erc-server-connect-function 'open-network-stream)
  )

(defun erc-through-proxy()
  "Setup local proxy and connect to IRC"
  (interactive)
  (setup-localproxy)
  (erc-start-or-switch)
  )

(defun erc-direct-connection()
  "Unsetup local proxy and connect to IRC"
  (interactive)
  (unsetup-localproxy)
  (erc-start-or-switch)
  )

;; Joining && autojoing.
(erc-autojoin-mode t)
(setq erc-autojoin-channels-alist
      '((".*\\.freenode.net" "#webrtc")))

(defun erc-start-or-switch ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (if (get-buffer "irc.freenode.net") ;; ERC already active?
      (erc-track-switch-buffer 1) ;; yes: switch to last active
    (when (y-or-n-p "Start ERC? ") ;; no: maybe start ERC
      (erc :server "irc.freenode.net" :port 6667 :nick "jaoo"))))

;; Switch to ERC with Ctrl+c e.
(global-set-key (kbd "C-c e") 'erc-start-or-switch)

(provide 'init-erc)
