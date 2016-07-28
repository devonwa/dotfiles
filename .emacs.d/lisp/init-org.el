;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org


;; Dependencies
(require 'ox-latex)

;; Scale Latex
(plist-put org-format-latex-options :scale 1.5)

;; Scale inline images
(setq org-image-actual-width '(400))

;; Use flyspell for spell checking
;; (require 'flyspell)
;; (add-hook 'org-mode-hook 'turn-on-flyspell)

;; babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (sh . t)
;   (matlab . t)
;   (sqlite . t)
;   (ruby . t)
;   (perl . t)
   (org . t)
;   (dot . t)
;   (plantuml . t)
;   (R . t)
   (C . t)))
