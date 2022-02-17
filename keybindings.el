;;; keybindings.el --- My personnal keybindings for emacs
;;; Commentary:
;; TODO : Switch to general.el or some other keybind manager/helper
;; TODO : Reorganize ?

;;; Code:
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
(global-set-key (kbd "C-l") 'goto-line)

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
(global-set-key (kbd "C-S-w") 'kill-region)
(global-set-key (kbd "C-w") 'kill-whole-line)
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "C-f") 'hs-toggle-hiding) ;; Fold code blocks

(global-set-key (kbd "C-c j") 'meghanada-jump-declaration)
(global-set-key (kbd "C-c s") 'isearch-forward)
(global-set-key (kbd "C-x s") 'save-buffer)
(global-set-key (kbd "C-c C-e") 'eval-buffer)
(global-set-key (kbd "C-M-w") 'kill-current-buffer)

(require 'vterm)
(global-set-key (kbd "C-M-<return>") 'vterm)
(define-key vterm-mode-map (kbd "C-r") 'other-window)
(define-key vterm-mode-map (kbd "C-<deletechar>") 'sp-delete-word)
(define-key vterm-mode-map (kbd "C-b") 'persp-switch-to-buffer)
(define-key vterm-mode-map (kbd "C-M-w") 'kill-current-buffer)

(global-set-key (kbd "C-b") 'persp-switch-to-buffer)
(global-set-key (kbd "M-b") 'persp-remove-buffer)
(global-set-key (kbd "C-²") 'centaur-tabs-forward)

(require 'lsp-java)
(define-key java-mode-map (kbd "C-c C-t") 'compile-and-run-test-java)
(define-key java-mode-map (kbd "C-d") 'forward-word)
(define-key java-mode-map (kbd "C-c c") 'comment-or-uncomment-region)

(provide 'keybindings)
;;; keybindings.el ends here
