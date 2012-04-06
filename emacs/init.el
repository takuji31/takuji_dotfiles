

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