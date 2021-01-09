
;; Initializes Smart Parens Mode
;; From: https://dev.to/deciduously/how-i-emacs-and-so-can-you-packages-m9p

(use-package smartparens
  :config
  (require 'smartparens-config)
  (add-hook 'lisp-mode-hook #'smartparens-strict-mode))

(provide 'init-smartparens)
