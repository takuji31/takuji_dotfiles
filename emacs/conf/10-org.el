(require 'org)
(defun org-insert-upheading (arg)
  (interactive "P")
  (org-insert-heading arg)
  (cond ((org-on-heading-p) (org-do-promote))
        ((org-at-item-p) (org-indent-item -1))))
(defun org-insert-heading-dwim (arg)
  (interactive "p")
  (case arg
    (4  (org-insert-sub-heading nil))
    (16 (org-insert-upheading nil))
    (t  (org-insert-heading nil))))
(define-key org-mode-map (kbd "<C-return>") 'org-insert-heading-dwim)

(org-remember-insinuate)                ;org-remeneberの初期化
(setq org-directory "~/memo/")
(setq org-default-notes-file (expand-file-name "memo.org" org-directory))
;; テンプレート
(setq org-remember-templates
      '(("Note" ?n "** %?\n    %i\n    %a\n    %t" nil "Inbox")
        ("Todo" ?t "** TODO %?\n    %i\n    %a\n    %t" nil "Inbox")))
