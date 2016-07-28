;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm

;; from jmax.el https://github.com/jkitchin/jmax
;; http://tuhdo.github.io/helm-intro.html
(require 'helm)
(setq helm-command-prefix-key "C-c h")
(require 'helm-config)
(require 'helm-eshell)
(require 'helm-files)
(require 'helm-grep)

(define-key 'help-command (kbd "C-f") 'helm-apropos)
(define-key 'help-command (kbd "r") 'helm-info-emacs)
(define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
(define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
(define-key helm-grep-mode-map (kbd "p") 'helm-grep-mode-jump-other-window-backward)
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(define-key helm-map (kbd "C-x 2") 'helm-select-2nd-action)
(define-key helm-map (kbd "C-x 3") 'helm-select-3rd-action)
(define-key helm-map (kbd "C-x 4") 'helm-select-4rd-action)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x r l") 'helm-bookmarks)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h s") 'helm-semantic-or-imenu)
(global-set-key (kbd "C-c h m") 'helm-man-woman)
(global-set-key (kbd "C-c h f") 'helm-find)
(global-set-key (kbd "C-c h l") 'helm-locate)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-c h r") 'helm-resume)
(global-set-key (kbd "C-c m") 'helm-all-mark-rings)

;; use helm to list eshell history
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "M-l")  'helm-eshell-history)))

  ;;; Save current position to mark ring
(add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

;; * helm extensions
;; add some useful functions to helm-find-files

(defun helm-attach-to-email (candidate)
  (mml-attach-file candidate))


(defun helm-find-files-insert-path (target)
  "Insert relative path to TARGET."
  (insert (file-relative-name target)))


(defun helm-find-files-insert-absolute-path (target)
  "Insert absolute path to TARGET."
  (insert (expand-file-name target)))


(add-hook 'helm-find-files-before-init-hook
          (lambda ()

	    (helm-add-action-to-source
	     "Insert path"
	     'helm-find-files-insert-path
	     helm-source-find-files)

	    (helm-add-action-to-source
	     "Insert absolute path"
	     'helm-find-files-insert-absolute-path
	     helm-source-find-files)

	    (helm-add-action-to-source
	     "Attach file to email"
	     'helm-attach-to-email helm-source-find-files)

	    (helm-add-action-to-source
	     "Make directory"
	     (lambda (target)
	       (make-directory target))
	     helm-source-find-files)))


(define-key helm-find-files-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "<backtab>") 'helm-find-files-up-one-level)
(define-key helm-find-files-map (kbd "<S-tab>") 'helm-find-files-up-one-level)
