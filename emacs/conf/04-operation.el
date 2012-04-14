;; find-file-at-point
(ffap-bindings)

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

;; goto-chg
(require 'goto-chg)
(global-set-key (kbd "<f8>") 'goto-last-change)
(global-set-key (kbd "S-<f8>") 'goto-last-change-reverse)

;;1行目がシェバングなら実行権限つけて保存
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; CUAモードON
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; yasnippet
(require 'yasnippet-config)
(yas/setup "~/.emacs.d/elisp/yasnippet")

;; viewer.el
(require 'viewer)
(viewer-stay-in-setup)
(setq viewer-modeline-color-unwritable "tomato")
(setq viewer-modeline-color-view "orange")
(viewer-change-modeline-color-setup)