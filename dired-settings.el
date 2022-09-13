;;; dired-settings.el --- My settings for dired file manager
;;; Commentary:
;;; Code:

(require 'dired)

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(setq insert-directory-program "ls")
(setq dired-listing-switches "-ABhg --group-directories-first")

;; Use zqsd to navigate through files in dired
(define-key dired-mode-map "z" 'previous-line)
(define-key dired-mode-map "q" 'dired-up-directory)
(define-key dired-mode-map "s" 'next-line)
(define-key dired-mode-map "d" 'dired-find-file)

(define-key dired-mode-map "n" 'dired-create-directory)
(define-key dired-mode-map "b" 'dired-create-empty-file)
(define-key dired-mode-map "r" 'dired-do-rename)

(define-key dired-mode-map "k" 'kill-current-buffer)

(define-key dired-mode-map "h" 'dired-hide-details-mode)

(provide 'dired-settings)
;;; dired-settings.el ends here
