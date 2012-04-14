;;Auto Complete Mode
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
               "~/.emacs.d/elisp/ac-dict")
  ;; FIXME C-TABだとうまくきかないっぽい、M-TABだとWindowsで使えない、さぁどうする
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default))

