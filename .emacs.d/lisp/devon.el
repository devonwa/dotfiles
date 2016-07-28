;; -*- mode: Lisp -*-


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Backend

;; Use emacs as a server
(require 'server)
(unless (server-running-p)
    (server-start))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Text

;; Tabs become spaces
(setq-default indent-tabs-mode nil)

;; Line numbers (bad for big files)
(global-linum-mode nil)

;; Color theme
(load-theme 'leuven t)
;(load-theme 'zenburn t)

;; from jmax.el
(global-font-lock-mode t)          ;; turn on font-lock mode everywhere
(auto-fill-mode -1)
(show-paren-mode 1)                ;; highlight parentheses
(setq show-paren-style 'mixed)     ;; alternative is 'expression, 'parenthesis or 'mixed
;(line-number-mode 1)               ;; turn linumbers on in mode-line

