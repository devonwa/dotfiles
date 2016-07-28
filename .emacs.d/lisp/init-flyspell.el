;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; flyspell

(global-set-key [f5] 'flyspell-mode)

;; adjust this path if it is not where aspell got installed
;(setq-default ispell-program-name "C:/Program Files (x86)/Aspell/bin/aspell.exe")

(require 'flyspell)
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(autoload 'flyspell-delay-command "flyspell" "Delay on command." t)
;(flyspell-mode t)

(add-hook 'org-mode-hook 'turn-on-flyspell 'append)

