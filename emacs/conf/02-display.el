;; ファイル名がかぶった場合にバッファ名をわかりやすくする
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;;ステータスライン
;;カラム番号表示
(column-number-mode t)
(size-indication-mode t)
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time-mode t)
;;リージョン内の行数と文字数をモードラインに表示する
(defun count-lines-and-chars ()
  (if mark-active
      (format "%d lines,%d chars "
	      (count-lines (region-beginning) (region-end))
	      (- (region-end) (region-beginning)))
    ""))
(add-to-list 'default-mode-line-format '(:eval (count-lines-and-chars)))
;;タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")

;;タブ幅は4
(setq-default tab-width 4)
;;タブなんてなかったんや
(setq-default indent-tabs-mode nil)

;;カラーの設定
(when (require 'color-theme nil t)
  (color-theme-initialize)
  (when (require 'color-theme-wombat nil t)
    (color-theme-wombat)))

;;ハイライト
(global-hl-line-mode t)
(set-face-background 'hl-line "darkolivegreen")

;;括弧の強調表示
(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "yellow")
;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")

;; 現在桁のハイライト
(require 'col-highlight)
(toggle-highlight-column-when-idle 1)
(col-highlight-set-interval 6)


;; ブロック折りたたみ
(require 'hideshow)
(require 'fold-dwim)

;; スタートアップ非表示
(setq inhibit-startup-screen t)

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;; tabbar
(require 'tabbar)
(tabbar-mode 1)