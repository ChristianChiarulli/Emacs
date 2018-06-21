
;; housekeeping
  (setq inhibit-startup-message t)
  (tool-bar-mode -1)
  ;;(menu-bar-mode -1)
  (scroll-bar-mode -1)
  (fset 'yes-or-no-p ' y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)
(setq org-src-fontify-natively t)

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

;; for tabs at the top
(require 'tabbar)
;; Tabbar settings
(set-face-attribute
 'tabbar-default nil
 :background "gray20"
 :foreground "gray20"
 :box '(:line-width 1 :color "gray20" :style nil))
(set-face-attribute
 'tabbar-unselected nil
 :background "gray30"
 :foreground "white"
 :box '(:line-width 5 :color "gray30" :style nil))
(set-face-attribute
 'tabbar-selected nil
 :background "gray75"
 :foreground "black"
 :box '(:line-width 5 :color "gray75" :style nil))
(set-face-attribute
 'tabbar-highlight nil
 :background "white"
 :foreground "black"
 :underline nil
 :box '(:line-width 5 :color "white" :style nil))
(set-face-attribute
 'tabbar-button nil
 :box '(:line-width 1 :color "gray20" :style nil))
(set-face-attribute
 'tabbar-separator nil
 :background "gray20"
 :height 0.6)

;; Change padding of the tabs
;; we also need to set separator to avoid overlapping tabs by highlighted tabs
(custom-set-variables
 '(tabbar-separator (quote (0.5))))
;; adding spaces
(defun tabbar-buffer-tab-label (tab)
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  (let ((label  (if tabbar--buffer-show-groups
                    (format "[%s]  " (tabbar-tab-tabset tab))
                  (format "%s  " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))

(tabbar-mode 1)

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
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

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

(use-package powerline
  :ensure t
  :config
  (require 'powerline)
  (powerline-default-theme))

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

(global-linum-mode 1)

(setq py-python-command "/usr/bin/python3")
;;    (use-package jedi
;;      :ensure
;;      :init
;;      (add-hook 'python-mode-hook 'jedi:ac-setup)
;;      (add-hook 'python-mode-hook 'jedi:setup)
;;      (setq jedi:complete-on-dot t)
;;      (setq jedi:environment-root "jedi"))

    (use-package elpy
      :ensure t
      :config
      (elpy-enable))
