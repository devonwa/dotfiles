;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; evil

(setq evil-want-C-i-jump nil)
(setq evil-want-C-u-scroll t)

(package 'evil)
(require 'evil)
(evil-mode 1)

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)


;; evil-leader
(package 'evil-leader)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "x" 'helm-M-x
  "b" 'helm-mini
  "f" 'helm-find-files
  "n" 'next-buffer
  "p" 'previous-buffer
  "d" 'kill-this-buffer
  "t" 'neotree-toggle
  "o" 'other-window
  "0" 'delete-window
  "1" 'delete-other-windows
  "2" 'split-window-below
  "3" 'split-window-right
  "j" 'outline-next-heading
  "k" 'outline-previous-heading
  "u" 'outline-up-heading
  )


;; evil-surround
(package 'evil-surround)
(require 'evil-surround)
(global-evil-surround-mode 1)
(evil-define-key 'visual evil-surround-mode-map "s" 'evil-surround-region)


;; evil-matchit
(package 'evil-matchit)
(require 'evil-matchit)
(global-evil-matchit-mode 1)


;; evil-nerd-commenter
(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "\\" 'evilnc-comment-operator ; if you prefer backslash key
  )


;; evil-exchange
(package 'evil-exchange)
(require 'evil-exchange)
(evil-exchange-cx-install)


;; evil-visualstar
(package 'evil-visualstar)
(global-evil-visualstar-mode)
