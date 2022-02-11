;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(require 'use-package)
(setq use-package-always-ensure t)

;; UI tweaks
(setq inhibit-startup-message nil)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(column-number-mode 1)      ; Show column number
;; (global-display-line-numbers-mode) ; Show line number on the left

(menu-bar-mode -1)            ; Disable the menu bar

;; Change all "Yes/No" to "Y/N"
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

(global-set-key (kbd "C-c l") 'display-line-numbers-mode)

(global-set-key (kbd "C-c d") 'crux-duplicate-current-line-or-region)
(global-set-key (kbd "C-c M-d") 'crux-duplicate-and-comment-current-line-or-region)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)

(global-set-key (kbd "C-<return>") 'crux-smart-open-line)
(global-set-key (kbd "C-S-<return>") 'crux-smart-open-line-above)
(global-set-key (kbd "C-w") 'kill-whole-line)

(global-set-key (kbd "C-c j") 'meghanada-jump-declaration)
(global-set-key (kbd "C-c s") 'isearch-forward)
(global-set-key (kbd "C-x s") 'save-buffer)
(global-set-key (kbd "C-c C-e") 'eval-buffer)
(global-set-key (kbd "C-M-w") 'kill-current-buffer)

(require 'vterm)
(define-key vterm-mode-map (kbd "C-r") 'other-window)
(define-key vterm-mode-map (kbd "C-<deletechar>") 'sp-delete-word)
(define-key vterm-mode-map (kbd "C-b") 'persp-switch-to-buffer)

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
(load-theme 'doom-catppuccin t)
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

;; Some custom functions

(defun kill-dired-buffers ()
  ;; Kill all dired buffers
  (interactive)
  (mapc (lambda (buffer)
          (when (eq 'dired-mode (buffer-local-value 'major-mode buffer))
            (kill-buffer buffer)))
        (buffer-list)))

;; Tabs in emacs, everyday we get closer to vscode
(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t))
(setq centaur-tabs-style "slant")
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-cycle-scope 'tabs)
;; Disable tabs in dired mode
(add-hook 'dired-mode-hook 'centaur-tabs-local-mode)

;; Highlight matching parentheses
(use-package paren
  :config
  (set-face-attribute 'show-paren-match-expression nil :background "#363e4a")
  (show-paren-mode 1))

;;;;; EDITOR CONFIG ;;;;;;

;; Drag stuff
(drag-stuff-global-mode 1)
(drag-stuff-define-keys)

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

(setq lsp-java-java-path "/usr/lib64/openjdk-17/bin/java")
(setq meghanada-java-path "/usr/lib64/openjdk-17/bin/java")

(defun compile-and-run-test-java ()
  "Compile and run a file named 'Test'."
  (interactive)
  (shell-command "javac *.java && java Test"))

(define-key java-mode-map (kbd "C-c C-t") 'compile-and-run-test-java)
(define-key java-mode-map (kbd "C-d") 'forward-word)
(define-key java-mode-map (kbd "C-c c") 'comment-or-uncomment-region)

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
(load "/home/paul/.opam/default/share/emacs/site-lisp/tuareg-site-file")

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#1B1B29" "#F28FAD" "#ABE9B3" "#FAE3B0" "#89DCEB" "#DDB6F2" "#C9CBFF" "#EEFFFF"])
 '(bui-indent 4)
 '(company-meghanada-insert-args t)
 '(custom-buffer-indent 4)
 '(custom-safe-themes
   '("e733147f0a2956dbc8dbb95321e8f72509f55153e49bb34203ea2a71b81c8b22" "60fabab4eafa46027a9206764474b1933e8c34a22ed39a6fc9c09f79f4f16083" "e882812c71eb4a715377f25fbfb0b55012e18ac05e7cccb3adcf5f2849f25898" "404618a57fc45f1067b6d948904893f551449e995e741f49140b5ed57ff2c484" "ebb4dcac54ea97fe01b39d134230507557bba31a235dd33ea7bcceb8cefb096b" "ddb0e3b808bb6ec3bbee2ec7f7f4f3f6c8081e3b137a176c346bfb4dcf3aa188" "2e796750cbe9a19dfa70f32dafb96f63614bb06ed0d20d38a7b217565f53e7aa" "a3a3997f2ca927b3a3e3f91e286b5a895df19b14a3d5f654c7dd083d84fc5c96" "082ddf98025de83bcca9db147c82ee7d3df5eba3b7e47a6b3e6fb4d4328d2733" "0ac075332e4008e6bca82ba943a16c87624607801032d829c996c45d4fdd751b" "2e09439b60cdd38d60ac7a2729385a8b327aaf255f6013692b06899e73b06bb6" "f4af1c30e03483ca856d72a67744373d0b886affb6f9098b8374bc3e31b2af01" "7c647ab9de1faf7b4b9e2e8251729f8ce5d728e287bf08998dbb7447b395184d" "54fa7289c596e0695b407b76f1eeea92a4d226208ed1e34e8a8c2b5127833b35" "0a690eab4791cd18f2c7c8d438a24fdb4ef53aab4424b15cacac282524b7d2da" "ee7b8fed69dce3f35dca52bdf2ebff223c44c737687e3f2da1ebe8270ca0930f" "a40b2e92053e79f9deba01ef9928032db8519e2af7cb89ef9f2759b22fae889c" "11cc65061e0a5410d6489af42f1d0f0478dbd181a9660f81a692ddc5f948bf34" "6128465c3d56c2630732d98a3d1c2438c76a2f296f3c795ebda534d62bb8a0e3" "3c7a784b90f7abebb213869a21e84da462c26a1fda7e5bd0ffebf6ba12dbd041" "e266d44fa3b75406394b979a3addc9b7f202348099cfde69e74ee6432f781336" "d9a28a009cda74d1d53b1fbd050f31af7a1a105aa2d53738e9aa2515908cac4c" "1d44ec8ec6ec6e6be32f2f73edf398620bb721afeed50f75df6b12ccff0fbb15" "7d33d24f8a074ca3215dc87004c0752dab6e86f18ed8451b63bf67c2d488b461" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" "d47f868fd34613bd1fc11721fe055f26fd163426a299d45ce69bef1f109e1e71" "47db50ff66e35d3a440485357fb6acb767c100e135ccdf459060407f8baea7b2" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "0d01e1e300fcafa34ba35d5cf0a21b3b23bc4053d388e352ae6a901994597ab1" "23c806e34594a583ea5bbf5adf9a964afe4f28b4467d28777bcba0d35aa0872e" "a9a67b318b7417adbedaab02f05fa679973e9718d9d26075c6235b1f0db703c8" "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" default))
 '(dap-mode t nil (dap-mode))
 '(exwm-floating-border-color "#1A1826")
 '(fci-rule-color "#676E95")
 '(god-mode-alist '((nil . "C-") ("m" . "M-") ("G" . "C-M-")))
 '(highlight-tail-colors ((("#292f36") . 0) (("#2c2c3e") . 20)))
 '(indent-tabs-mode nil)
 '(jdee-db-active-breakpoint-face-colors (cons "#161320" "#DDB6F2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#161320" "#ABE9B3"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#161320" "#676E95"))
 '(mpc-songs-format "%-5{Time} %25{Title} %20{Album} %20{Artist}")
 '(objed-cursor-color "#F28FAD")
 '(package-selected-packages
   '(merlin-company utop rainbow-mode kaolin-themes crux drag-stuff vterm merlin tuareg dashboard exwm pair-tree autothemer haskell-mode emms dap-java god-mode helm-company speed-type vimish-fold lsp-javacomp lsp-java perspective doom-themes which-key use-package))
 '(pdf-view-midnight-colors (cons "#EEFFFF" "#1B1B29"))
 '(rustic-ansi-faces
   ["#1B1B29" "#F28FAD" "#ABE9B3" "#FAE3B0" "#89DCEB" "#DDB6F2" "#C9CBFF" "#EEFFFF"])
 '(vc-annotate-background "#1B1B29")
 '(vc-annotate-color-map
   (list
    (cons 20 "#ABE9B3")
    (cons 40 "#c5e7b2")
    (cons 60 "#dfe4b1")
    (cons 80 "#FAE3B0")
    (cons 100 "#f9d6a7")
    (cons 120 "#f8c99e")
    (cons 140 "#F8BD96")
    (cons 160 "#efbab4")
    (cons 180 "#e5b8d3")
    (cons 200 "#DDB6F2")
    (cons 220 "#e4a9db")
    (cons 240 "#eb9cc4")
    (cons 260 "#F28FAD")
    (cons 280 "#cf86a7")
    (cons 300 "#ac7ea1")
    (cons 320 "#89769b")
    (cons 340 "#676E95")
    (cons 360 "#676E95")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(vertico-current ((t (:background "#3a3f5a")))))
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
