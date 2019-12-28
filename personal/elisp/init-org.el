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
        ("CANCELED" . (:foreground "#BF6571" :weight bold))
        ("WAITING" . "#D7263D")))

(setq org-todo-keywords
      '((sequence "TODO(t)"
                  "DONE(d)"
                  "WAITING(w)"
                  "DELEGATED(g)"
                  "CANCELED(c)")))

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

;; Capture templates
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/inbox.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")))



;; Refile target
(setq org-file-targets '(
                         (nil :maxlevel . 2)
                         (org-agenda-files :maxlevel .2)
                         ))

;; Fix habits on agenda, habits used to not show on timegrid.
(setq org-agenda-sorting-strategy
      '((agenda time-up priority-down category-keep)
        (todo   priority-down category-keep)
        (tags   priority-down category-keep)
        (search category-keep)))

;; Activate appt for notifications
(appt-activate t)
;; Set format. 'echo' for echo area. 'window' is another option
(setq appt-display-format 'echo)

;; Rebuild agenda from scratch
(defun tmolnar/org-agenda-to-appt ()
  "Rebuild all appt reminders"
  (interactive)
  (setq appt-time-msg-list nil)
  (org-agenda-to-appt))

;; Add to hook
(if (string= (car (split-string org-version "\\.")) "9")
    (add-hook 'org-agenda-mode-hook 'tmolnar/org-agenda-to-appt 'append)
  (add-hook 'org-finalize-agenda-hook 'tmolnar/org-agenda-to-appt 'append))

;; Build list of appointments on start
(tmolnar/org-agenda-to-appt)

;; Notiication duration
(setq appt-display-duration 50)

;; How long in advance to be notified
(setq appt-message-warning-time 30)

;; rebuild notifications at time
(run-at-time "12:00" nil 'tmolnar/org-agenda-to-appt)

;; org - alert. Alternative to org-agenda-to-appt
;; Set style
(setq alert-default-style 'libnotify)


(load "org-habit-plus")
(require 'org-journal)
(provide `init-org)
