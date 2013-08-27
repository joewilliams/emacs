(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(setq load-path (cons "/usr/local/lib/erlang/lib/tools-2.6.11//emacs" load-path))
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
(require 'erlang-start)

(set-face-attribute 'default nil :font "Droid Sans Mono-12")

(global-linum-mode 1)
(setq linum-format "%d ")

(add-to-list 'load-path "~/.emacs.d/tuareg")
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(autoload 'tuareg-imenu-set-imenu "tuareg-imenu" 
  "Configuration of imenu for tuareg" t) 
(add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
(setq auto-mode-alist 
    (append '(("\\.ml[ily]?$" . tuareg-mode)
       ("\\.topml$" . tuareg-mode))
            auto-mode-alist))

(speedbar 1)
(speedbar-toggle-show-all-files)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(setq load-path (cons "~/.emacs.d/color-theme" load-path))
(require 'color-theme)

(setq load-path (cons "~/.emacs.d/color-theme/themes" load-path))
(require 'color-theme-tangotango)
(color-theme-tangotango)

(setq load-path (cons "~/.emacs.d/vimpulse" load-path))
(require 'vimpulse)

(setq load-path (cons "~/.emacs.d/undo-tree" load-path))
(require 'undo-tree)
(global-undo-tree-mode)

(setq load-path (cons "~/.emacs.d/autopair" load-path))
(require 'autopair)
(autopair-global-mode)

(setq load-path (cons "~/.emacs.d/fill-column-indicator" load-path))
(require 'fill-column-indicator)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

;(setq load-path (cons "~/.emacs.d/tabbar" load-path))
;(require 'tabbar)
;(tabbar-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'init)
