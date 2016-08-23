;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Scimax - post-load

;; Turn off update check
;; (setq scimax-auto-update nil)

;; Set theme
(setq scimax-user-theme 'leuven)
;; (setq scimax-user-theme 'zenburn)

;; Turn on spell checking
;; (add-hook 'org-mode-hook 'turn-on-flyspell)

;; set i(a)spell options on different machines
;; (setq ispell-personal-dictionary (concat starter-kit-dir "user/.ispell"))

;; Hotspots
(setq scimax-user-hotspot-commands
      '(("Calendar" . (lambda ()
                        (browse-url "https://www.google.com/calendar/render")))
        ("Contacts" . helm-org-contacts)
        ("Agenda" . (lambda () (org-agenda "" "w")))
        ))

;; Email
(setq user-full-name "Devon Walker"
      andrewid "devonw"
      user-mail-address "devonw@andrew.cmu.edu"
      ;; specify how email is sent
      send-mail-function 'smtpmail-send-it
      ;; used in message mode
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "smtp.andrew.cmu.edu"
      smtpmail-smtp-service 587)    

;; Turn off beacon (gray cursor highlighting)
(beacon-mode 1)
(setq beacon-size 10)
(setq beacon-color "#FFFF85")

;; Remove lispy mode (forceful auto-complete)
;(remove-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode) (eldoc-mode)))
;; (use-package lispy
;;   :config
;;   (dolist (hook '(emacs-lisp-mode-hook
;;                   hy-mode-hook))
;;     (remove-hook hook
;;                  (lambda ()
;;                    (lispy-mode)
;;                    (eldoc-mode)))))

;; Remove aggressive indent
(use-package aggressive-indent
  :config (aggressive-indent-global-mode 0))

