;;キーバインド割り当て
;改行/インデント
(global-set-key (kbd "C-m") 'newline-and-indent)
;折り返し表示切り替え
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)
;ウィンドウ切り替え(tmuxのprefix切り替えないと動かないよ)
(global-set-key (kbd "C-t") 'other-window)

;;行表示の切り替え
(defun toggle-global-linum-mode ()
  (interactive)
  (global-linum-mode nil))
(global-set-key (kbd "C-c C-l") 'toggle-global-linum-mode)
