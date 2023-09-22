;; LSP CONFIG

(use-package lsp-mode
  :commands lsp
  :hook ((caml-mode java-mode c-mode) . lsp)
  :custom (lsp-headerline-breadcrumb-enable nil))

(use-package lsp-ui)

;; Check for errors on the fly
(use-package flycheck :ensure t :init (global-flycheck-mode))

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
            ))
(setq meghanada-java-path "java")
(setq meghanada-maven-path "mvn")

(setq lsp-java-configuration-runtimes '[(:name "openjdk11"
                                               ;; :path "/usr/lib64/openjdk-11")])
                                               ;; :path "/usr/lib/jvm/openjdk-11")])
;; (setq lsp-java-java-path "/usr/lib64/openjdk-11/bin/java")
;; (setq meghanada-java-path "/usr/lib64/openjdk-11/bin/java")

;; Ocaml stuff
(require 'merlin)
(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
      (when (and opam-share (file-directory-p opam-share))

        ;; Register Merlin
        (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
        (autoload 'merlin-mode "merlin" nil t nil)
        ;; Automatically start Merlin in OCaml buffers
        (add-hook 'caml-mode-hook 'tuareg-mode t)
        (add-hook 'caml-mode-hook 'merlin-mode t)
        (add-hook 'tuareg-mode-hook 'merlin-mode t)
        ;; Use opam switch to lookup ocamlmerlin binary
        (setq merlin-command 'opam)))
(load "/home/paul/.opam/default/share/emacs/site-lisp/tuareg-site-file")
