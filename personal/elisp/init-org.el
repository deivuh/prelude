(require 'org)

;;orgmode agenda
(global-set-key (kbd "C-c a") 'org-agenda)

;;habits ++
;; Tell emacs where is your personal elisp lib dir
;;(add-to-list 'load-path "~/.emacs.d/org-modules/")

;; load the packaged named xyz.
;;(load "org-habit-plus") ;; best not to include the ending “.el” or “.elc”

;; Add folder to agenda
(setq org-agenda-files '("~/org"))

(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "#4D9DE0" :weight bold))
        ("DONE" . (:foreground "#75CC27" :weight bold))
        ("DELEGATED" . (:foreground "#FF9A0C" :weight bold))
        ("CANCELLED" . (:foreground "#775B59" :weight bold))
        ("WAITING" . "#FF2828")))

(setq org-todo-keywords
      '((sequence "TODO"
                  "DONE"
                  "WAITING"
                  "DELEGATED"
                  "CANCELLED")))

(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

;; Refile target
(setq org-file-targets '(
                         (nil :maxlevel . 2)
                         (org-agenda-files :maxlevel .2)
                         ))

(provide `init-org)
