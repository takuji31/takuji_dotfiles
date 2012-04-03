;; ロードするディレクトリを設定する関数
(when (> emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d"))
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-to-plevel-add-subdirs-to-load-path))))))
(add-to-load-path "elisp" "conf" "repos")

(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

