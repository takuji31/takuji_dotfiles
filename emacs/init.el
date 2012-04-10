;; ロードするディレクトリを設定する関数
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "elisp" "conf" "repos")

(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")


;;ELPA
(when (require 'package nil t)
  ;;パッケージリポジトリの設定
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
  (package-initialize))

;;eldoc
(defun elisp-mode-hooks ()
  "list-mode-hooks"
  (when (require 'eldoc nil t)
    (setq eldoc-idle-delay 0.2)
    (setq eldoc-echo-area-use-multiline-p t)
    (turn-on-eldoc-mode)))
(add-hook 'emacs-lisp-mode-hook 'elisp-mode-hooks)


;;auto-installの設定
(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup))

(when (require 'redo+ nil t)
  (global-set-key (kbd "C-.") 'redo))

;;キーバインド割り当て
;改行/インデント
(global-set-key (kbd "C-m") 'newline-and-indent)
;折り返し表示切り替え
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)
;ウィンドウ切り替え(tmuxのprefix切り替えないと動かないよ)
(global-set-key (kbd "C-t") 'other-window)

;言語/文字コードの設定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))
(when (eq system-type 'w32)
  (set-file-name-coding-system 'cp932)
  (setq locale-coding-system 'cp932))

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

;;行表示の切り替え
(defun toggle-global-linum-mode ()
  (interactive)
  (global-linum-mode nil))
(global-set-key (kbd "C-c C-l") 'toggle-global-linum-mode)

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

;;括弧の強調表示
(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "yellow")

;;1行目がシェバングなら実行権限つけて保存
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;;Anything.el
(when (require 'anything nil t)
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

  (when (require 'anything-config nil t)
    (setq anything-su-or-sudo "sudo"))

  (require 'anything-match-plugin nil t)

  (when (and (executable-find "cmigemo")
             (require 'migemo nil t))
    (require 'anything-migemo nil t))

  (when (require 'anything-complete nil t)
    (anything-lisp-complete-symbol-set-timer 150))

  (require 'anything-show-completion nil t)

  (when (require 'auto-install nil t)
    (require 'anything-auto-install nil t))

  (when (require 'descbinds-anything nil t)
    (descbinds-anything-install)))

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

;;color-moccur
(when (require 'color-moccur nil t)
  (global-set-key (kbd "M-o") 'occur-by-moccur)
  (setq moccur-split-word t)
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$")
  (when (and (executable-find "cmigemo")
             (require 'migemo nil t))
    (setq moccur-use-migemo t))

  (require 'moccur-edit nil t))

;;wgrep
(require 'wgrep nil t)

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

;;cperl-modeの設定
(defalias 'perl-mode 'cperl-mode)
;;; インデント
(setq cperl-indent-level 4
      cperl-continued-statement-offset 4
      cperl-brace-offset -4
      cperl-label-offset -4
      cperl-indent-parens-as-block t
      cperl-close-paren-offset -4
      cperl-tab-always-indent t
      cperl-highlight-variables-indiscriminately t)
;;PSGIとテストファイルはcperl-modeで開く
(setq auto-mode-alist (append '(("\\.psgi$" . cperl-mode)) auto-mode-alist))
(setq auto-mode-alist (append '(("\\.t$" . cperl-mode)) auto-mode-alist))

;;yaml-mode
(when (require 'yaml-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode)))

(defun perl-completion-hook ()
  (when (require 'perl-completion nil t)
    (perl-completion-mode t)
    (when (require 'auto-complete nil t)
      (auto-complete-mode t)
      (make-variable-buffer-local 'ac-sources)
      (setq ac-sources '(ac-source-perl-completion)))))
(add-hook 'cperl-mode-hook 'perl-completion-hook)

