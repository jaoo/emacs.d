(require 'package)

(setq package-enable-at-startup nil)
(setq package-check-signature (when (executable-find "gpg") 'allow-unsigned))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(package-initialize)

(defun require-package (package)
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(defun maybe-require-package (package)
  (condition-case err
      (require-package package)
    (error
     (message "Couldn't install package `%s': %S" package err)
     nil)))

(let ((parent-dir (expand-file-name "site-lisp/" user-emacs-directory)))
  (dolist (dir (directory-files parent-dir))
    (unless (string-match "^\\." dir)
      (add-to-list 'load-path (expand-file-name dir parent-dir)))))

(provide 'init-package)
