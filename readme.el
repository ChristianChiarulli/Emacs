
;; housekeeping
  (setq inhibit-startup-message t)
  (tool-bar-mode -1)
  (set-window-fringes nil 0 0)
;;(menu-bar-mode -1)
  (setq frame-title-format "emacs")
  (scroll-bar-mode -1)
  (fset 'yes-or-no-p ' y-or-n-p)
  ;;
  (setq org-src-fontify-natively t)
  (show-paren-mode)
  (fset 'jdent
      [return return ?\C-p tab])
  (global-set-key (kbd "C-j") nil)
  (global-set-key (kbd "C-j") 'jdent)
  (set-face-attribute 'vertical-border
                    nil
                    :foreground "#282a2e")

;; let's user try a package before installing 
(use-package try
        :ensure t)

;; useful for remembering what keys do
(use-package which-key
        :ensure t 
        :config
        (which-key-mode))

;; Org-mode stuff
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; ido stuff (I now use swiper/counsel)
;;(setq ido-enable-flex-matching t)
;;(setq ido-everywhere t)
;;(ido-mode 1)

;; for buffers
;;(defalias 'list-buffers 'ibuffer)
;; use this to open buffers in a seperate window
(defalias 'list-buffers 'ibuffer-other-window)

;; ace-windows & other window configurations
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 1.0)))))
    ))
(windmove-default-keybindings)
(winner-mode 1)

;; using swiper for search and such
(use-package counsel
  :ensure t
  )
(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    (setq ivy-display-style 'fancy)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
    ))

;; avy jump to things in Emacs tree style using chars
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

;; autocomplete using auto-complete
;;(use-package auto-complete
;;  :ensure t
;;  :init
;;  (progn
;;    (ac-config-default)
;;    (global-auto-complete-mode t)
;;    ))

(use-package company
  :ensure t)
(add-hook 'after-init-hook 'global-company-mode)
(require 'color)

;; Themes for Emacs
  (use-package color-theme
    :ensure t)

  ;; This is a variant of zenburn which used to be called darkburn
  ;;(use-package zenburn-theme
  ;;  :ensure t
  ;;  :config (load-theme 'zenburn t))
  ;;(setq zenburn-override-colors-alist
  ;;      '(("zenburn-bg" . "#000000")
          ;;("zenburn-bg+1" . "#111111")
          ;;("zenburn-bg+2" . "#111111")
          ;;("zenburn-bg+3" . "#111111")
          ;;("zenburn-bg+05" . "#111111")
;;          ))
  ;;(load-theme 'zenburn t)
  (use-package afternoon-theme
    :ensure t
    :config (load-theme 'afternoon t))
(set-face-background 'fringe "#181a26")
(require 'linum nil 'noerror)
(set-face-foreground 'linum "#969896")

;;  (use-package powerline
;;    :ensure t
;;    :config
;;    (require 'powerline)
;;    (powerline-default-theme))
  ;;  (set-face-attribute 'power-line nil
;;                      :box '(:width 0))

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
    (setq spaceline-buffer-encoding-abbrev-p nil)
    (setq spaceline-line-column-p nil)
    (setq spaceline-line-p nil)
    (setq powerline-default-separator (quote arrow))
    (spaceline-spacemacs-theme))
    (setq spaceline-default-separator nil)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(use-package neotree
  :ensure t
  :config
  (require 'neotree)
  (global-set-key [f8] 'neotree-toggle))
;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; currently out of order

(use-package smartparens
  :ensure t
  :init
  (require 'smartparens-config)
  (smartparens-global-mode 1)
  (smartparens-global-strict-mode 1))

(global-set-key (kbd "<f9>") 'linum-mode)

(require 'sublimity)
(require 'sublimity-scroll)
(sublimity-mode 1)

(minimap-mode 1)

;;(use-package anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(setq python-shell-interpreter "python3")
(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))
(add-hook 'python-mode-hook 'anaconda-mode)
