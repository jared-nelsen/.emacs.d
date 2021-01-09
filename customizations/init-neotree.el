
;; Initializes the neotree packages
;; From: https://dev.to/deciduously/how-i-emacs-and-so-can-you-packages-m9p

(use-package neotree
  :init
  (require 'neotree)
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-smart-open t)
  )

(provide 'init-neotree)
