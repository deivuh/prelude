;;; init-mu4e.el --- mu4e settings

(require 'mu4e)
(setq mu4e-maildir "~/mbsync")
(setq mu4e-drafts-folder "/[Gmail].Drafts")
(setq mu4e-sent-folder   "/[Gmail].Sent Mail")
;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)
;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "mbsync -V gmail")

(setq mu4e-sent-folder   "/[Gmail].Sent Mail"
      mu4e-trash-folder  "/[Gmail].Trash"
      mu4e-refile-folder "/[Gmail].All Mail")


;; shortcuts
(setq mu4e-maildir-shortcuts
    '( ("/INBOX"               . ?i)
       ("/[Gmail].Sent Mail"   . ?s)))

;; something about ourselves
(setq
   user-mail-address "davidhsiehlo@gmail.com"
   user-full-name  "David Hsieh"
   mu4e-compose-signature
    (concat
      "Cheers,\n"
      "David\n"))

;; show images
(setq mu4e-show-images t)

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; convert html emails properly
;; Possible options:
;;   - html2text -utf8 -width 72
;;   - textutil -stdin -format html -convert txt -stdout
;;   - html2markdown | grep -v '&nbsp_place_holder;' (Requires html2text pypi)
;;   - w3m -dump -cols 80 -T text/html
;;   - view in browser (provided below)
(setq mu4e-html2text-command "textutil -stdin -format html -convert txt -stdout")

;; spell check
(add-hook 'mu4e-compose-mode-hook
        (defun my-do-compose-stuff ()
           "My settings for message composition."
           (set-fill-column 72)
           (flyspell-mode)))

;; add option to view html message in a browser
;; `aV` in view to activate
(add-to-list 'mu4e-view-actions
  '("ViewInBrowser" . mu4e-action-view-in-browser) t)

;; fetch mail every 10 mins
(setq mu4e-update-interval 600)


;; configuration for sending mail
(setq message-send-mail-function 'smtpmail-send-it
     smtpmail-stream-type 'starttls
     smtpmail-default-smtp-server "smtp.gmail.com"
     smtpmail-smtp-server "smtp.gmail.com"
     smtpmail-smtp-service 587)


(provide `init-mu4e)
;;; init-mu4e ends here
