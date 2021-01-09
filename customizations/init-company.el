
;; Initializes Company Mode
;; From: https://dev.to/deciduously/how-i-emacs-and-so-can-you-packages-m9p

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(provide 'init-company)
