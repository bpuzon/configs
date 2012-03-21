;;Required plugins:
;Erlang OTP, color-theme, distel, auto-complete-distel
;


;; Erlang
(setq load-path (cons  "/otp/R15B/lib/erlang/lib/tools-2.6.6.6/emacs" load-path))
(setq erlang-root-dir "/otp/R15B/lib/erlang/")
(setq inhibit-splash-screen t)
(setq exec-path (cons "/otp/R15B/lib/erlang/bin" exec-path))
(require 'erlang-start)

;;Indenting
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

(add-to-list 'load-path "~/.emacs.d/")
(require 'color-theme)
(load-file "~/.emacs.d/themes/color-theme-tangotango.el")
(color-theme-initialize)
(color-theme-tangotango)


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
;; Highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#252525")
;; Don't highlight selection
(setq-default transient-mark-mode nil)
;; Remove menu bar
(menu-bar-mode 0)

;; Line numbers
(require 'linum)
(global-linum-mode 1)

;;Show whitespaces
(require 'whitespace)
(setq whitespace-style '(trailing))
(global-whitespace-mode t)

;;Autocomplete
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'erlang-mode)
(setq ac-auto-start nil)
(ac-set-trigger-key "TAB")
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/ac-dict")
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


;;Not under MAC
;; Dont show toolbar
(tool-bar-mode -1)
