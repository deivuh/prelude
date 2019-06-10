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
      '(("TODO" . (:foreground "#F46036" :weight bold))
        ("DONE" . (:foreground "#C5D86D" :weight bold))
        ("DELEGATED" . (:foreground "#1B998B" :weight bold))
        ("CANCELLED" . (:foreground "#BF6571" :weight bold))
        ("WAITING" . "#D7263D")))

(setq org-todo-keywords
      '((sequence "TODO"
                  "DONE"
                  "WAITING"
                  "DELEGATED"
                  "CANCELLED")))

(setq org-priority-faces '((?A . (:foreground "#FAF3DD" :weight 'bold))
                           (?B . (:foreground "#C8D5B9"))
                           (?C . (:foreground "#8FC0A9"))
                           (?D . (:foreground "#68B0AB"))
                           (?E . (:foreground "#4F7558"))))

;; Setting background color
(if (display-graphic-p)
    (setq initial-frame-alist
          '(
            (tool-bar-lines . 0)
            (width . 106)
            (height . 60)
            (background-color . "#2E294E")
            (left . 50)
            (top . 50)))
  (setq initial-frame-alist '( (tool-bar-lines . 0))))

;; Cursor color
(set-cursor-color "#E8E8E8") 

(setq default-frame-alist initial-frame-alist)

(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

;; Refile target
(setq org-file-targets '(
                         (nil :maxlevel . 2)
                         (org-agenda-files :maxlevel .2)
                         ))

(provide `init-org)
