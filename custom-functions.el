;;; custom-functions.el --- Some custom elisp functions
;;; Commentary:
;;; Code:

(defun kill-dired-buffers ()
  "Kill all Dired buffers."
  (interactive)
  (mapc (lambda (buffer)
          (when (eq 'dired-mode (buffer-local-value 'major-mode buffer))
            (kill-buffer buffer)))
        (buffer-list)))

(defun compile-and-run-test-java ()
  "Compile and run a file named 'Test'."
  (interactive)
  (shell-command "javac *.java && java Test"))

(defun scrot-take-screenshot ()
  "Use 'scrot -s' to take a screenshot in a resizable rectangle."
  (interactive)
  (shell-command "cd ~/Pictures && scrot -s"))

(defun switch-between-init-and-init-exwm ()
  "'init.el'  becomes init.el-backup and vice versa."
  (interactive)
  (shell-command "mv init.el tempfile && mv init.el-backup init.el && mv tempfile init.el-backup"))

;; Custom defkey from olivertaylor's config
(defun defkey (map &rest body)
  "Define a key for MAP with specs in BODY.
A custom wrapper around `define-key' that does 2 things:
1. All string defs of a key are wrapped in `kbd'.
2. You can define multiple keys in the style of `setq'."
  (while body
    (let ((key (car body))
          (def (cadr body)))
      (define-key
        map
        (if (stringp key) (kbd key) key)
        def)
      (setq body (cddr body)))))
(provide 'defkey)

;; The key binding technique below is taken from the bind-key package. It
;; places all the bindings I don't want overridden into a minor mode which is
;; inserted into the `emulation-mode-map-alists', so only very few things can
;; override them.

(defvar bosskey-mode-map (make-sparse-keymap))

(define-minor-mode bosskey-mode
  "Minor mode for my personal keybindings, which override others.
The only purpose of this minor mode is to override global keybindings."
  :init-value t
  :global t
  :keymap bosskey-mode-map)

(add-to-list 'emulation-mode-map-alists
             `((bosskey-mode . ,bosskey-mode-map)))

(provide 'custom-functions)
;;; custom-functions.el ends here
