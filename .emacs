;; Erlang
(setq load-path (cons  "/home/bartek/dev/erl/R15B/lib/erlang/lib/tools-2.6.6.6/emacs/" load-path))
(setq erlang-root-dir "/home/bartek/dev/erl/R15B/lib/erlang/")
(setq inhibit-splash-screen t)
(setq exec-path (cons "/home/bartek/dev/erl/R15B/lib/erlang/bin" exec-path))
(require 'erlang-start)

;;Indenting
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)


;;Look
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "black" :foreground "grey70" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(font-lock-builtin-face ((t (:foreground "grey50"))))
 '(font-lock-comment-face ((t (:foreground "darkgreen"))))
 '(font-lock-constant-face ((t (:foreground "grey50"))))
 '(font-lock-doc-face ((t (:foreground "grey50"))))
 '(font-lock-doc-string-face ((t (:foreground "yellow2"))))
 '(font-lock-function-name-face ((t (:foreground "SteelBlue"))))
 '(font-lock-keyword-face ((t (:foreground "red"))))
 '(font-lock-preprocessor-face ((t (:foreground "SteelBlue"))))
 '(font-lock-reference-face ((t (:foreground "LightSkyBlue"))))
 '(font-lock-string-face ((t (:foreground "yellow2"))))
 '(font-lock-type-face ((t (:foreground "violet"))))
 '(font-lock-variable-name-face ((t (:foreground "orange"))))
 '(font-lock-warning-face ((t (:foreground "grey50"))))
 '(isearch ((t (:background "yellow4" :foreground "black"))))
 '(mode-line ((t (:background "grey90" :foreground "black"))))
 '(zmacs-region ((t (:background "grey70" :foreground "black")))))


;;Distel
(add-to-list 'load-path "/usr/local/share/distel/elisp")
(require 'distel)
(distel-setup)
(setq inferior-erlang-machine-options '("-sname" "emacs@ariel"))
(setq derl-cookie "a")

;;IDO
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;Various
;; Current row and column in statusbar
(column-number-mode t)
;; Matching parentheses
(show-paren-mode t)
;; Line numbers
(global-linum-mode 1)
;; Highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#252525")
;; Dont show toolbar
(tool-bar-mode -1)
;; Don't highlight selection
(setq-default transient-mark-mode nil)

;;Show whitespaces
(require 'whitespace)
(setq whitespace-style '(trailing))
(global-whitespace-mode t)

;;Autocomplete
(add-to-list 'load-path "/home/bartek/.emacs.d/plugins")
(add-to-list 'load-path "/home/bartek/.emacs.d/")
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'erlang-mode)
(setq ac-auto-start nil)
(ac-set-trigger-key "TAB")
(add-to-list 'ac-dictionary-directories "/home/bartek/.emacs.d/plugins/ac-dict")
;;Autocomplete shortcuts
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
;;Autocomplete-distel
(require 'auto-complete-distel)
(defun ac-distel-setup ()
   (setq ac-sources '(ac-source-distel)))
(add-hook 'erlang-mode-hook 'ac-distel-setup)
(add-hook 'erlang-shell-mode-hook 'ac-distel-setup)

;;Flymake
(require 'erlang-flymake)
(setq erlang-flymake-get-include-dirs-function
  'includes-list)
(setq erlang-flymake-get-code-path-dirs-function
  'codepath-list)

(defun includes-list ()
  '("dir1" "dir2"))
(defun codepath-list ()
  '("dir1" "dir2"))


;;Shortcuts
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-l") 'goto-line)
