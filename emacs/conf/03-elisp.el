;;eldoc
(require 'eldoc-extension)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(setq eldoc-minor-mode-string "")
(setq eldoc-idle-delay 0.2)

(require 'lispxmp)

(when (require 'auto-async-byte-compile nil t)
  ;; 自動コンパイルを無効にするファイル名の正規表現
  (setq auto-async-byte-compile-exclude-files-regexp "(init.el|/conf/)")
  (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode))