;; -*- mode: Lisp -*-

;; Variables
(setq my_path-projects "~/Dropbox/")
(when (string= system-name "gilgamesh.cheme.cmu.edu")
  (setq my_path-projects "~/")
  (setq remote_login t)
  )
(setq my_path-bib (concat my_path-projects "bibliography/"))
(setq my_path-lib (concat my_path-projects "lib/"))


;; Packages
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(when (not package-archive-contents)
  (package-refresh-contents))


;; Install packages if not already installed
;; https://github.com/rmm5t/dotfiles/blob/master/emacs.d/personal/defuns.el
(defun package (package)
  (when (not (package-installed-p package))
    (package-install package)))


;; Check packages
(package 'evil)
(package 'evil-leader)
(package 'helm)
(package 'flyspell)
(package 'neotree)
(package 'org)
(package 'org-ref)
(package 'ox-reveal)


;; Load-path
(add-to-list 'load-path (concat user-emacs-directory
                                (convert-standard-filename "lisp/")))


;; Load confifuration files with a warning on error
(defun load_config (setting_path)
  "Report load errors."
  (condition-case nil
      (load setting_path)
    (error (lwarn 'initialization 'warning 
                  "%s did not load properly." setting_path))))


;; Load package specific settings (order may matter)
(load_config "init-evil.el")
(load_config "init-neotree.el")
(load_config "init-recentf.el")
(load_config "init-helm.el")
(load_config "init-org.el")
(load_config "init-org-ref.el")
(load_config "init-ox-reveal.el")
(load_config "init-flyspell.el")


;; lib: Gilgamesh
(load_config (concat my_path-lib "kitchinhub/gilgamesh/gilgamesh.el"))
(load_config (concat my_path-lib "kitchinhub/gilgamesh/ivy-gilgamesh.el"))


;; lib: Scimax
(load_config "init-scimax-pre.el")
(load_config (concat my_path-lib "jkitchin/scimax/init.el"))
(load_config "init-scimax-post.el")


;; Themes
(add-to-list 'custom-theme-load-path
(concat user-emacs-directory
(convert-standard-filename "themes/")))
;; (setq org-level-color-stars-only t)
;; (load-theme 'zenburn)


;; Highlight current line
;; (global-hl-line-mode 1)
;; (set-face-background 'hl-line "#FAFAFA")
;; (set-face-foreground 'highlight nil)


;; Set cursor color
(set-cursor-color "#763A87") 


;; Use single emacs instance as a server
(if nil remote_login
(require 'server)
(unless (server-running-p)
(server-start))
)


;; Put temporary files in tmp directory
(setq backup-directory-alist
`((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
`((".*" ,temporary-file-directory t)))


;; Tramp
(setq tramp-default-method "ssh")
(setq explicit-shell-file-name "/bin/bash") 
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)
(add-to-list 'tramp-remote-process-environment
(format "DISPLAY=%s" (getenv "DISPLAY")))


;; Tabs become spaces
(setq-default indent-tabs-mode nil)

;; Disable the bell notification
(setq visible-bell t)

;; Relative line numbers (bad for big files)
;; (package 'linum-relative)
;; (require 'linum-relative)
;; (linum-relative-on)


;; ;; git status in bottom bar
;; ;; http://superuser.com/questions/576953
;; (defadvice vc-git-mode-line-string (after plus-minus (file) compile activate)
;; (setq ad-return-value
;; (concat ad-return-value
;; (let ((plus-minus (vc-git--run-command-string
;; file "diff" "--numstat" "--")))
;; (and plus-minus
;; (string-match "^\\([0-9]+\\)\t\\([0-9]+\\)\t"
;; plus-minus)
;; (format " +%s-%s"
;; (match-string 1 plus-minus)
;; (match-string 2 plus-minus)))))))

