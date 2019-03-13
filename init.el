(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-misc)
(require 'init-os-keys)

(require 'init-package)
(require 'init-utils)

(require 'init-gist)
(require 'init-google-c-style)

(require 'init-exec-path)

(require 'init-erc)

(require 'init-ggtags)
(require 'init-auto-complete)
(require 'init-ido)
(require 'init-fill-column-indicator)
(require 'init-javascript)

(require 'init-markdown)

(require 'server)
(unless (server-running-p)
  (server-start))

(provide 'init)
