;; emacs-starter-kit
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; install packages
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings hl-line+ auto-complete js2-mode coffee-mode yasnippet php-mode php-completion helm helm-gtags\
 web-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; basic
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
;;(setq-default c-basic-offset 4)
(menu-bar-mode -1)
;(global-hl-line-mode -1)

;; color
(set-face-background 'default "black")
(set-face-foreground 'default "white")
(set-face-background 'hl-line "gray13")

;; font
(set-frame-font "Inconsolata-16")

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-sources 'ac-source-yasnippet)
(setq ac-auto-start nil)
(ac-set-trigger-key "TAB")

;;web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))
