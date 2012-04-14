;;Anything.el
(require 'anything-startup)
(setq
   ;; 候補を表示するまでの時間
   anything-idle-delay 0.3
   ;; 再描画までの時間
   anything-input-idle-delay 0.2
   ;; 候補の最大数
   anything-candidate-number-limit 100
   ;; 体感速度を速くする
   anything-quick-update t
   ;; ショートカットをアルファベットに
   anything-enable-shorcuts 'alphabet)
(setq anything-su-or-sudo "sudo")
(anything-lisp-complete-symbol-set-timer 150)

;; anything-for-filesをC-;で起動してやる
(global-set-key (kbd "C-;") 'anything-for-files)
;; M-yをanything-show-kill-ringに置き換え
(global-set-key (kbd "M-y") 'anything-show-kill-ring)

;; descbinds-anythingを画面分割で表示
(setq descbinds-anything-window-style 'split-window)

