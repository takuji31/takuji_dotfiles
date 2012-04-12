;; find-file-at-point
(ffap-bindings)

;; バッファ切り替え強化
(iswitchb-mode 1)
(setq read-buffer-function 'iswitchb-read-buffer)
;; 正規表現を使えるように
(setq iswitchb-regexp t)
;; バッファー作成時に確認をしない
(setq iswitchb-prompt-newbuffer nil)

;; redo機能の追加
(when (require 'redo+ nil t)
  (global-set-key (kbd "C-.") 'redo))


;;undohist
(when (require 'undohist nil t)
  (undohist-initialize))

;;undo-tree
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

;; point-undo
(when (require 'point-undo nil t)
  (global-set-key (kbd "M-[") 'point-undo)
  (global-set-key (kbd "M-]") 'point-redo))

;;1行目がシェバングなら実行権限つけて保存
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

