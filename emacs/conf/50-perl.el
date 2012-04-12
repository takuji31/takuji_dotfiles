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