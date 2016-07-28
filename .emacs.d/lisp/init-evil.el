;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; evil

(setq evil-want-C-i-jump nil)
(setq evil-want-C-u-scroll t)

(require 'evil)
(evil-mode 1)

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)


;; evil-leader
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "x" 'helm-M-x
  "b" 'helm-mini
  "f" 'helm-find-files
  "n" 'next-buffer
  "p" 'previous-buffer
  "d" 'ido-kill-buffer
  "t" 'neotree-toggle
  "o" 'other-window
  "0" 'delete-window
  "1" 'delete-other-windows
  "2" 'split-window-below
  "3" 'split-window-right
  )
