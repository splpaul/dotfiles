;;; init.el --- My emacs config

;;; Commentary:
;; Todo : Break up in smaller files and overall cleanup
;; Todo : Fix meghanada and lsp-java bug, maybe linked to gentoo "java-VM" use flag?
;; Todo : Move from use package?

;;; Code:

;; Reduce frequency of garbage collection (better performance)
(setq gc-cons-threshold (* 50 1000 1000))

;; Initialize package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(require 'use-package)
(setq use-package-always-ensure t)

;; Change all "yes/no" to "y/n"
(fset 'yes-or-no-p 'y-or-n-p)

;; Startup page
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-startup-banner "/home/paul/Pictures/gentoo_alpha_small.png")

;; Better scrolling from system crafters config
(setq mouse-wheel-scroll-amount '(1 ((sshift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq use-dialog-box nil)

;; Load custom functions
(load-file "~/.emacs.d/custom-functions.el")
;; Load keybindings
(load-file "~/.emacs.d/keybindings.el")
;; Load appearance tweaks
(load-file "~/.emacs.d/appearance.el")
;; Load dired config (TODO: Defer until dired started)
(load-file "~/.emacs.d/dired-settings.el")
;; Load LSP config (TODO: Defer until prog-mode-hook)
(load-file "~/.emacs.d/lsp.el")

;; Perspective : better buffer management (not used, centaur tabs nicely groups buffers)
;; (use-package perspective
;;   :config
;;   (persp-mode))

;; Help me remember my keybinds
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;; God mode : Commands without pressing ctrl (I don't use this anymore as I use multistate)
;; (require 'god-mode)
;; (global-set-key (kbd "<print>") #'god-local-mode)
;; (which-key-enable-god-mode-support)

;; Vertico : Better menus and commands/file name completion
(use-package vertico
  :init
  (vertico-mode))

;; Matches and completion with different character orders
(use-package orderless
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Saves command history even after restart
(use-package savehist
  :init
  (savehist-mode))

;; Tabs in emacs, everyday we get closer to vscode
(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t))
(setq centaur-tabs-style "slant")
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-cycle-scope 'tabs)
;; Disable tabs in certain modes
(add-hook 'dired-mode-hook 'centaur-tabs-local-mode)
(add-hook 'vterm-mode-hook 'centaur-tabs-local-mode)

;; Highlight matching parentheses
(use-package paren
  :config
  (set-face-attribute 'show-paren-match-expression t :background "#363e4a")
  (show-paren-mode 1))

;;;;; EDITOR CONFIG ;;;;;;

;; Drag stuff
(require 'drag-stuff)
(drag-stuff-global-mode 1)
(drag-stuff-define-keys)

;; Indent stuff
(setq-default indent-tabs-mode nil) ;; Indent with spaces for consistent indent on different machines
(setq-default tab-width 4)

;; Company autocompletion
(use-package company)
(add-hook 'after-init-hook 'global-company-mode)

;; Company helm interface
(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "C-:") 'helm-company)
     (define-key company-active-map (kbd "C-:") 'helm-company)))

;; Makes company show a little documentation popup
(company-quickhelp-mode)

;; Dap debugger
;; (use-package dap-mode
;;   :after lsp-mode
;;   :config (dap-auto-configure-mode))


;; Color related parentheses
(use-package smartparens
  :hook (prog-mode . smartparens-mode))

;; Automatically remove trailing whitespaces
(use-package ws-butler
  :hook ((text-mode . ws-butler-mode)
         (prog-mode . ws-butler-mode)))

;; Folding code blocks with Ctrl-f
(add-hook 'prog-mode-hook 'hs-minor-mode)

;; Magit
(use-package magit
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; Show everyone on discord you're part of the church of emacs
(use-package elcord
  :custom
  (elcord-display-buffer-details t)
  (elcord-quiet t)
  :config
  (elcord-mode))

;; Hide all the weird stuff emacs adds to init.el
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; Set gc back to default after loading init file
(setq gc-cons-threshold (* 2 1000 1000))

(provide 'init)
;;; init.el ends here
