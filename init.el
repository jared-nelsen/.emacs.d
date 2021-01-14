;
;;Jared's Emacs Init File

;;----------------------------------------------------------------------------------------------------------
;; Instructions
;;----------------------------------------------------------------------------------------------------------
;; 1. Open Emacs for the first time and let it build everything
;; 2. Update packages and install darktooth theme
;; 3. Ensure that the load theme darktooth call is uncommented in this file

;;----------------------------------------------------------------------------------------------------------
;; Repositories
;;----------------------------------------------------------------------------------------------------------

;; Define Package Repositories
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;;----------------------------------------------------------------------------------------------------------
;; Packages
;;----------------------------------------------------------------------------------------------------------

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

	;;----------------------------------------------------------------------------------------------------------
	;; Package Specific Code
	;;----------------------------------------------------------------------------------------------------------
		;; Define the following variables to remove the compile-log warnings when defining ido-ubiquitous
		(defvar ido-cur-item nil)
		(defvar ido-default-item nil)
		(defvar ido-cur-list nil)
		(defvar predicate nil)
		(defvar inherit-input-method nil)

;;----------------------------------------------------------------------------------------------------------
;; Custom Packages
;;----------------------------------------------------------------------------------------------------------
;; List the packages I use

;; paredit :: Makes handling lisp expressions much easier
;; clojure-mode :: Key bindings and code colorization for Clojure
;; clojure-mode-extra-font-locking :: Extra syntax highlighting for Clojure
;; ido-ubiquitous :: Allow ido usage in as many contexts as possible
;; smex :: Enhances Mx to allow easier execution of commands. Provides a filterable
;;		   list of possible commands in the minibuffer
;; projectile :: Project navigation
;; rainbow-delimiters :: Colorful parenthesis matching
;; tagedit :: Edit HTML tags like sexps
;; magit :: Git integration
;; cider :: Clojure development environment
;; eldoc :: Cider dependency for documentation
;; idle-highlight-mode :: Automatically highlights variable instances
;; use-package :: A nifty tool to simplify emacs package management
;; darktooth :: My chosen theme

(setq package-list '(paredit
                     darktooth-theme
					 clojure-mode
					 clojure-mode-extra-font-locking
					 ido-completing-read+
					 ivy
					 smex
					 projectile
					 rainbow-delimiters
					 tagedit
					 magit
					 cider
					 fsharp-mode
					 eldoc
					 idle-highlight-mode
					 treemacs
           			 smartparens
           			 magit
					 flycheck
                                         docker
					 use-package))

;; Install any missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;;---------------------------------------------------------------------------------------------------------
;; Extra packages
;;---------------------------------------------------------------------------------------------------------

;; Docker
(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

;; elpy for Python
(require 'use-package)
(use-package elpy
  :ensure t
  :init
  (elpy-enable))
(setq elpy-rpc-python-command "/usr/bin/python3")

;;----------------------------------------------------------------------------------------------------------
;; Add-in elisp files :
;;     Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able to load them. Loading elisp
;;	   files can be accomplished with:
;;         (require 'NAME_OF_ELISP MODE) :: ex (require 'yaml-mode)
;;         (add-to-list 'auto-mode-alist 'EXPRESSION_PERTAINING_TO_FILE)
;;----------------------------------------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/vendor")

;;----------------------------------------------------------------------------------------------------------
;; Customization Files
;;----------------------------------------------------------------------------------------------------------
;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.

(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")
(load "clang-format.el")
(load "modern-cpp-font-lock.el")

;; General emacs configurations
;;     From: https://dev.to/deciduously/how-i-emacs-and-so-can-you-packages-m9p
(load "counsel.el")
(load "ivy.el")
(load "swiper.el")
(load "which-key.el")
(load "init-smartparens.el")
(load "smartparens.el")
(load "find-file-in-project.el")
(load "init-neotree.el")
(load "treemacs-custom.el")
(load "fsharp-custom.el")

;;----------------------------------------------------------------------------------------------------------
;; Custom Set Variables
;;----------------------------------------------------------------------------------------------------------

;; Your init file should contain only one such instance of these types of customizations.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#eaeaea" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#000000"))
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("f153e8ed90e4d79cf2c61560da2b3091d2f3b94da42aaddc707012be4608cf52" default)))
 '(fci-rule-color "#2a2a2a")
 '(package-selected-packages
   (quote
    (## dired-sidebar
		omnisharp
		darktooth-theme
		tagedit
		smex
		rainbow-delimiters
		projectile
		paredit
		magit
		ido-ubiquitous
		exec-path-from-shell
		clojure-mode-extra-font-locking
		cider)))

;;----------------------------------------------------------------------------------------------------------
;; My Customizations
;;----------------------------------------------------------------------------------------------------------

;; Prevent idiocy
(global-set-key (kbd "C-z") nil)

;; Load the Dark Tooth Theme
(load-theme 'darktooth t)

(require 'rainbow-delimiters)

;; Highlight identical text instances all the time
(define-globalized-minor-mode identical-highlight-mode idle-highlight-mode
	(lambda () (idle-highlight-mode 1)))
(identical-highlight-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(cider-font-lock-dynamically '(macro function var deprecated core))
 '(coffee-tab-width 2)
 '(custom-safe-themes
   '("85968e61ff2c490f687a8159295efb06dd05764ec37a5aef2c59abbd485f0ee4" "9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" default))
 '(package-selected-packages
   '(flycheck all-the-icons swiper elpy idle-highlight-mode tagedit smex rainbow-delimiters projectile paredit magit ido-ubiquitous darktooth-theme clojure-mode-extra-font-locking cider))
 '(pdf-view-midnight-colors '("#FDF4C1" . "#282828"))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;----------------------------------------------------------------------------------------------------------
;; General Emacs Configuration Setup
;;----------------------------------------------------------------------------------------------------------

;; Initialize Ivy mode
(require 'init-ivy)

;; Initialize Counsel Mode
(require 'init-counsel)

;; Initialize Flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; Initialize Company Mode
(require 'init-company)

;;Initialize Which-Key
(require 'init-which-key)

;; Initialize Smart Parens
(require 'init-smartparens)
(require 'smartparens-config)

;; Hook smart parens into language modes
(add-hook 'js-mode-hook #'smartparens-mode)
(add-hook 'python-mode-hook #'smartparens-mode)
(add-hook 'clojure-mode-hook #'smartparens-mode)
(add-hook 'haskell-mode-hook #'smartparens-mode)
(add-hook 'scala-mode-hook #'smartparens-mode)
(add-hook 'rust-mode-hook #'smartparens-mode)
(add-hook 'c++-mode-hook #'smartparens-mode)
(add-hook 'c-mode-hook #'smartparens-mode)

;; Initialize find-file-in-project
(require 'find-file-in-project)

;; Neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;;----------------------------------------------------------------------------------------------------------
;; Language Specific Setup
;;----------------------------------------------------------------------------------------------------------

;;------------------------------------------------------------
;; C++
;;------------------------------------------------------------

;; C Language Formatter
(require 'clang-format)
(global-set-key (kbd "C-c C-f") 'clang-format-region)

;; C++ Syntax Highlighting
(require 'modern-cpp-font-lock)
(modern-c++-font-lock-global-mode t)

;; C and C++ auto indenting
(global-set-key "\C-m" 'newline-and-indent)

;;----------------------------------------------------------------------------------------------------------
;; Windows
;;----------------------------------------------------------------------------------------------------------

;; Other Window Backwards
(defun myprevious-window ()
    (interactive)
    (other-window -1))
(global-set-key (kbd "C-x o") 'myprevious-window)
;; Other Window redefine
(global-set-key (kbd "C-x p") 'other-window)

;; Enable Menu bar
(menu-bar-mode 1)
;; Disable the Tool bar
(tool-bar-mode -1)

;;----------------------------------------------------------------------------------------------------------
;; Font
;;----------------------------------------------------------------------------------------------------------
(add-to-list 'default-frame-alist '(font . "JetBrains Mono-13"))
