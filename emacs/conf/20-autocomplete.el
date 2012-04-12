;;Auto Complete Mode
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
               "~/.emacs.d/elisp/ac-dict")
  ;; FIXME C-TABだとうまくきかないっぽい、M-TABだとWindowsで使えない、さぁどうする
  (define-key ac-mode-map (kbd "C-TAB") 'auto-complete)
  ;;auto-complete.elでだけ別フォントを使う
  ;;(set-face-font 'ac-candidate-face "VL Gothic 18")
  ;;(set-face-font 'ac-selection-face "VL Gothic 18")
  ;;(setq popup-use-optimized-column-computation nil)
  (ac-config-default))

