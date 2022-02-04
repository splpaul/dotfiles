;; UI tweaks
(setq inhibit-startup-message nil)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;; Startup page
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-startup-banner "/home/paul/pictures/emacs_600x400.png")

;; Better scrolling from system crafters config
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq use-dialog-box nil)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(require 'use-package)
(setq use-package-always-ensure t)

;; God mode => Commands without pressing ctrl
(require 'god-mode)
(global-set-key (kbd "<print>") #'god-local-mode)

;; -------KEYBINDS-----------

(define-prefix-command 'ring-map)
(global-set-key (kbd "C-x") 'ring-map)

(global-set-key (kbd "C-z") 'previous-line)
(global-set-key (kbd "C-q") 'backward-word)
(global-set-key (kbd "C-s") 'next-line)
(global-set-key (kbd "C-d") 'forward-word)
(global-set-key (kbd "C-M-d") 'forward-sexp)
(global-set-key (kbd "C-M-q") 'backward-sexp)
(global-set-key (kbd "C-a") 'beginning-of-line)
(global-set-key (kbd "C-e") 'end-of-line)

(global-set-key (kbd "C-x C-d") 'split-window-right)
(global-set-key (kbd "C-x C-s") 'split-window-below)
(global-set-key (kbd "C-x C-w") 'delete-window)
;; Resize windows
(global-set-key (kbd "C-x C-z") 'enlarge-window-horizontally)
(global-set-key (kbd "C-x C-q") 'shrink-window-horizontally)
(global-set-key (kbd "C-x C-e") 'enlarge-window)
;; Navigate windows
(global-set-key (kbd "C-r") 'other-window)

(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-w") 'kill-whole-line)

(global-set-key (kbd "C-x s") 'save-buffer)
(global-set-key (kbd "C-c C-e") 'eval-buffer)

(require 'dired)
(global-set-key (kbd "C-x C-f") 'dired)
(global-set-key (kbd "C-x C-g") 'dired-jump) ;; Open directory in full buffer with dired
;; Use zqsd to navigate through files in dired
(define-key dired-mode-map "z" 'previous-line)
(define-key dired-mode-map "q" 'dired-up-directory)
(define-key dired-mode-map "s" 'next-line)
(define-key dired-mode-map "d" 'dired-find-file)

(global-set-key (kbd "C-b") 'persp-switch-to-buffer)
(global-set-key (kbd "M-b") 'persp-remove-buffer)

(global-set-key (kbd "C-²") 'centaur-tabs-forward)

;; Perspective.el
(use-package perspective
  :config
  (persp-mode))

;; Help me remember my keybinds
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;; Vertico : Better menus and commands/file name completion
(use-package vertico
  :init
  (vertico-mode))

;; Match without character order
(use-package orderless
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Saves command history even after restart
(use-package savehist
  :init
  (savehist-mode))

;; Fancy themes
(use-package doom-themes :defer t)
(load-theme 'doom-palenight t)
(doom-themes-visual-bell-config)

;; Make your system theme match emacs theme
(require 'theme-magic)
(theme-magic-export-theme-mode)

;; Fancy font
(set-frame-font "MonoLisa 12")

(use-package minions
  :hook (doom-modeline-mode . minions-mode))

;; Fancy modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 2)
  :custom
  (doom-modeline-height 20)
  (doom-modeline-bar-width 6)
  (doom-modeline-lsp t)
  (doom-modeline-github t)
  (doom-modeline-minor-modes t)
  (doom-modeline-persp-name t)
  (doom-modeline-buffer-file-name-style 'truncate-except-project)
  (doom-modeline-major-mode-icon t))

;; Tabs in emacs, everyday we get closer to vscode
(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t))
(setq centaur-tabs-style "slant")
(setq centaur-tabs-set-icons t)
;; Disable tabs in dired mode
(add-hook 'dired-mode-hook 'centaur-tabs-local-mode)

;; Highlight matching parentheses
(use-package paren
  :config
  (set-face-attribute 'show-paren-match-expression nil :background "#363e4a")
  (show-paren-mode 1))

;;;;; EDITOR CONFIG ;;;;;;

;; Indent stuff
(setq-default indent-tabs-mode nil) ;; Indent with spaces
(setq-default tab-width 4)

;; LSP CONFIG

(use-package lsp-mode
  :commands lsp
  :hook ((c-mode java-mode ocaml-mode) . lsp)
  :bind (:map lsp-mode-map
         ("M-TAB" . completion-at-point))
  :custom (lsp-headerline-breadcrumb-enable nil))
(use-package lsp-ui)

;; Check for errors on the fly
(use-package flycheck :ensure t :init (global-flycheck-mode))

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

;; (use-package dap-mode
;;   :after lsp-mode
;;   :config (dap-auto-configure-mode))

;; C / C++
(use-package ccls
  :hook ((c-mode c++-mode) .
         (lambda ()
           (require 'ccls)
           (lsp)
           (flycheck-mode +1)
           (setq c-basic-offset 4)
           )))

;; Java
(require 'lsp-java)
(add-hook 'java-mode-hook #'lsp)
(require 'meghanada)
(add-hook 'java-mode-hook
          (lambda ()
            ;; meghanada-mode on
            (meghanada-mode t)
            (flycheck-mode +1)
            (setq c-basic-offset 4)
            ;; use code format
            ;(add-hook 'before-save-hook 'meghanada-code-beautify-before-save)
            ))
(setq meghanada-java-path "java")
(setq meghanada-maven-path "mvn")

;; Ocaml stuff
(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
      (when (and opam-share (file-directory-p opam-share))

        ;; Register Merlin
       (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
       (autoload 'merlin-mode "merlin" nil t nil)

       ;; Automatically start Merlin in OCaml buffers
       (add-hook 'tuareg-mode-hook 'merlin-mode t)
       (add-hook 'caml-mode-hook 'merlin-mode t)

       ;; Use opam switch to lookup ocamlmerlin binary
       (setq merlin-command 'opam)))

;; Color related parentheses
(use-package smartparens
  :hook (prog-mode . smartparens-mode))

;; Automatically remove trailing whitespaces
(use-package ws-butler
  :hook ((text-mode . ws-butler-mode)
         (prog-mode . ws-butler-mode)))

;; Folding code blocks with Ctrl-E
(global-set-key (kbd "C-f") 'hs-toggle-hiding)
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'ocaml-mode-hook 'hs-minor-mode)

;; Magit
(use-package magit
  :bind ("C-M-;" . magit-status)
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; Show everyone on discord you're part of the church of emacs
(use-package elcord
  :custom
  (elcord-display-buffer-details nil)
  :config
  (elcord-mode))

;; Move region/current line up and down
(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line ARG lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line ARG lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(provide 'move-text)

(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bui-indent 4)
 '(custom-buffer-indent 4)
 '(custom-safe-themes
   '("7d33d24f8a074ca3215dc87004c0752dab6e86f18ed8451b63bf67c2d488b461" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" "d47f868fd34613bd1fc11721fe055f26fd163426a299d45ce69bef1f109e1e71" "47db50ff66e35d3a440485357fb6acb767c100e135ccdf459060407f8baea7b2" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "0d01e1e300fcafa34ba35d5cf0a21b3b23bc4053d388e352ae6a901994597ab1" "23c806e34594a583ea5bbf5adf9a964afe4f28b4467d28777bcba0d35aa0872e" "a9a67b318b7417adbedaab02f05fa679973e9718d9d26075c6235b1f0db703c8" "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" default))
 '(dap-mode t nil (dap-mode))
 '(god-mode-alist '((nil . "C-") ("m" . "M-") ("G" . "C-M-")))
 '(indent-tabs-mode nil)
 '(mpc-songs-format "%-5{Time} %25{Title} %20{Album} %20{Artist}")
 '(package-selected-packages
   '(merlin tuareg dashboard exwm pair-tree autothemer haskell-mode emms dap-java god-mode helm-company speed-type meghanada vimish-fold lsp-javacomp lsp-java perspective doom-themes which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(vertico-current ((t (:background "#3a3f5a")))))
