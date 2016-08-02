;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-ref

(package 'org-ref)

(global-set-key [f10] 'org-ref-open-bibtex-notes)
(global-set-key [f11] 'org-ref-open-bibtex-pdf)
(global-set-key [f12] 'org-ref-open-in-browser)

(setq reftex-default-bibliography `(,(concat my_path-bib "references.bib")))

;; see org-ref.el for use of these variables
(setq org-ref-bibliography-notes (concat my_path-bib "bibliography.org")
      org-ref-default-bibliography `(,(concat my_path-bib "references.bib"))
      org-ref-pdf-directory (concat my_path-bib "bibtex-pdfs/"))

(setq helm-bibtex-bibliography (concat my_path-bib "references.bib"))
(setq helm-bibtex-library-path (concat my_path-bib "bibtex-pdfs/"))
(setq helm-bibtex-notes-path (concat my_path-bib "helm-bibtex-notes"))

;; open pdf with system pdf viewer (works on mac)
(setq helm-bibtex-pdf-open-function
      (lambda (fpath)
        (start-process "open" "*open*" "open" fpath)))

;; alternative
;; (setq helm-bibtex-pdf-open-function 'org-open-file)

