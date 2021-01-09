
;; Initializes ivy mode
;; From: https://dev.to/deciduously/how-i-emacs-and-so-can-you-packages-m9p

(use-package ivy
  :diminish (ivy-mode . "")
  :init (ivy-mode 1) ; globally at startup
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-height 20)
  (setq ivy-count-format "%d/%d "))

(provide 'init-ivy)
