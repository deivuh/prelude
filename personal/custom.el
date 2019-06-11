(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(global-hl-todo-mode t)
 '(org-default-priority 67)
 '(org-fast-tag-selection-single-key nil)
 '(org-lowest-priority 69)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(org-todo-keywords
   (quote
    ((sequence "TODO" "DONE" "WAITING" "DELEGATED" "CANCELED"))))
 '(org-use-fast-todo-selection t)
 '(package-selected-packages
   (quote
    (org-journal wakatime-mode geiser lsp-ui company-lsp json-mode js2-mode rainbow-mode elisp-slime-nav rainbow-delimiters company counsel swiper ivy exec-path-from-shell zop-to-char zenburn-theme which-key volatile-highlights undo-tree super-save smartrep smartparens operate-on-number move-text magit projectile imenu-anywhere hl-todo guru-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region epl editorconfig easy-kill diminish diff-hl discover-my-major crux browse-kill-ring beacon anzu ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "#E8E8E8" :foreground "#4D4770"))))
 '(custom-face-tag ((t (:inherit custom-variable-tag))))
 '(hl-line ((t (:background "#4D4770"))))
 '(org-level-1 ((t (:inherit default :foreground "goldenrod1"))))
 '(org-level-2 ((t (:inherit default :foreground "LightGoldenrod2"))))
 '(org-level-3 ((t (:inherit default :foreground "wheat1"))))
 '(org-level-4 ((t (:inherit default :foreground "cornsilk1"))))
 '(org-tag ((t (:foreground "#C2D3CD" :weight bold)))))


;; Hide extra GUI crap
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;;(set-frame-parameter nil 'undecorated t)
;; Set frame alpha 100 is focues 96 unfocused
(set-frame-parameter (selected-frame) 'alpha '(100 96))
(add-to-list 'default-frame-alist '(alpha 100 96))

;; key bindings
(when (eq system-type 'darwin) ;; mac specific settings
                                        ; (setq mac-control-modifier 'nil)
  (setq mac-right-control-modifier 'meta)
                                        ;  (setq mac-left-control-modifier 'meta)
  (setq mac-right-option-modifier 'none)
  t)

;; Load theme
(load-theme 'misterioso)

;; Read elisp directory
(add-to-list 'load-path (expand-file-name "personal/elisp" user-emacs-directory))

(require `init-mu4e)
(require `init-org)
