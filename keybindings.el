;;; keybindings.el --- My personnal keybindings for emacs

;;; Commentary:
"Using multistate to define different keymap states"

;;; Code:
(multistate-define-state
 'normal
 :lighter "N"
 :default t)

(multistate-define-state
 'editing
 :lighter "E"
 )

(multistate-define-state
 'visual
 :lighter "V"
 )

;; (multistate-global-mode 1)
(add-hook 'prog-mode-hook 'multistate-mode)
(add-hook 'dashboard-mode-hook 'multistate-mode)
;; (add-hook 'dired-mode-hook 'multistate-mode)

(defkey multistate-normal-state-map
  ;; Switch state
  "<print>" 'multistate-editing-state
  "v" 'multistate-visual-state
  ;;
  "S" 'save-buffer
  ;; Text
  "z" 'previous-line
  "s" 'next-line
  "d" 'forward-char
  "q" 'backward-char
  "C-q" 'backward-word
  "C-d" 'forward-word
  "C-a" 'beginning-of-line
  "C-e" 'end-of-line
  "C-x C-x" 'exchange-point-and-mark
  ;; Windows
  "x d" 'split-window-right
  "x s" 'split-window-below
  "x w" 'delete-window
  "x h e" 'enlarge-window-horizontally
  "x h s" 'shrink-window-horizontally
  "x e" 'enlarge-window
  "x r" 'other-window
  ;; Dired
  "x f" 'dired
  "x g" 'dired-jump
  ;; Killing
  "k l" 'kill-whole-line
  "k r" 'kill-region
  "k b" 'kill-current-buffer
  "k d" 'kill-dired-buffers
  "k o" 'delete-other-windows
  ;; Editing
  "C" 'kill-ring-save
  "y" 'yank
  "S-<return>" 'crux-smart-open-line
  "C-S-<return>" 'crux-smart-open-line-above
  "D D" 'crux-duplicate-current-line-or-region
  "D c" 'crux-duplicate-and-comment-current-line-or-region
  "," 'comment-or-uncomment-region
  ;; Line
  "l l" 'goto-line
  "l d" 'display-line-numbers-mode
  ;; Eval code
  "e r" 'eval-region
  "e b" 'eval-buffer
  "e R" 'crux-eval-and-replace
  ;; Project/Programming tools
  "c f" 'hs-toggle-hiding
  "c j" 'meghanada-jump-declaration
  "c s" 'isearch-forward
  ;;
  "M-<return>" 'vterm
  "C-<delete>" 'sp-delete-word
  "b s" 'switch-to-buffer
  "b k" 'kill-buffer)

(defkey multistate-editing-state-map
  ;; Switch state
  "<print>" 'multistate-normal-state)

(defkey multistate-visual-state-map
  ;; Switch state
  "<print>" 'multistate-normal-state
  ;; Modify region
  "rc" 'er/contract-region
  "re" 'er/expand-region
  ;; Multiple cursors mode
  "A" 'mc/mark-all-like-this
  "n" 'mc/mark-next-like-this
  "p " 'mc/mark-previous-like-this)

(global-set-key (kbd "C-<tab>") 'centaur-tabs-forward)
(global-set-key (kbd "M-<tab>") 'centaur-tabs-forward-group)
(global-set-key (kbd "C-c C-s") 'scrot-take-screenshot)

(require 'lsp-java)
(define-key java-mode-map (kbd "C-c C-t") 'compile-and-run-test-java)
(require 'caml)
(define-key caml-mode-map (kbd "C-c C-e") 'tuareg-run-ocaml)
(require 'utop)
(define-key utop-mode-map (kbd "C-z") 'utop-history-goto-prev)
(define-key utop-mode-map (kbd "C-s") 'utop-history-goto-next)

;; (define-prefix-command 'ring-map)
;; (global-set-key (kbd "C-x") 'ring-map)
;; (global-unset-key (kbd "C-c"))
;; (global-set-key (kbd "C-c") 'ring-map)

(provide 'keybindings)
;;; keybindings.el ends here
