
;; housekeeping
  (setq inhibit-startup-message t)
  (tool-bar-mode -1)
  (set-window-fringes nil 0 0)
  (menu-bar-mode -1)
  (global-set-key [f10] 'menu-bar-mode)
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
  ;; verticalborder between windows
  (set-face-attribute 'vertical-border
                    nil
                    :foreground "#282a2e")

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; (when window-system
  ;;     (use-package pretty-mode
    ;;   :ensure t
      ;; :config
       ;;(global-pretty-mode t)))

(setq make-backup-files nil)
(setq auto-save-default t)

(use-package dashboard
  :ensure t
  :config
    (dashboard-setup-startup-hook)
    (setq dashboard-startup-banner "~/.emacs.d/img/dashLogo.png")
    ;;(setq dashboard-items '((recents  . 5)
    ;;                        (projects . 5)))
    (setq dashboard-banner-logo-title ""))

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
(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

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
    (global-set-key "\M-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    ;;(global-set-key (kbd "C-c g") 'counsel-git)
    ;;(global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
    ))

;; avy jump to things in Emacs tree style using chars
(use-package avy
  :ensure t
  :bind ("C-s" . avy-goto-char-2))
  (global-set-key (kbd "M-g f") 'avy-goto-line)

(use-package company
   :ensure t
   :config
   
   (setq company-idle-delay 0)
   (setq company-minimum-prefix-length 4))
   
(with-eval-after-load 'company
   (define-key company-active-map (kbd "SPC") #'company-abort)
   (define-key company-active-map (kbd "M-n") nil)
   (define-key company-active-map (kbd "M-p") nil)
   (define-key company-active-map (kbd "C-n") #'company-select-next)
   (define-key company-active-map (kbd "C-p") #'company-select-previous)
   )
 (add-hook 'after-init-hook 'global-company-mode)

;; I edited the me directly for the modeline 
  ;; Themes for Emacs
  (when (display-graphic-p)
    (load-theme 'afternoon t)
    (set-face-background 'fringe "#181a26"))

  ;;(use-package color-theme
  ;;  :ensure t)

  ;;(use-package afternoon-theme
  ;;  :ensure t
  ;;  :config (load-theme 'afternoon t))
;;(set-face-background 'fringe "#181a26")
  
(require 'linum nil 'noerror)
;; possibly messing up highlights
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

(use-package diminish
:ensure t
:init
(diminish 'which-key-mode)
(diminish 'linum-relative-mode)
(diminish 'hungry-delete-mode)
(diminish 'visual-line-mode)
(diminish 'subword-mode)
(diminish 'beacon-mode)
(diminish 'irony-mode)
(diminish 'page-break-lines-mode)
(diminish 'auto-revert-mode)
(diminish 'rainbow-delimiters-mode)
(diminish 'rainbow-mode))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  (use-package yasnippet-snippets
      :ensure t)
  (yas-reload-all))
(add-to-list 'org-structure-template-alist
             '("el" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC"))

(use-package neotree
  :ensure t
  :config
  (require 'neotree)
  (global-set-key [f8] 'neotree-toggle))
;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(use-package smartparens
  :ensure t
  :init
  (require 'smartparens-config)
  (smartparens-global-mode 1)
  (smartparens-global-strict-mode 1))

(use-package rainbow-mode
:ensure t
:init
  (add-hook 'prog-mode-hook 'rainbow-mode))

(use-package rainbow-delimiters
:ensure t
:init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(global-set-key (kbd "<f9>") 'linum-mode)

(require 'sublimity)
(require 'sublimity-scroll)
(sublimity-mode 1)

;; https://www.emacswiki.org/emacs/MiniMap
(global-set-key [f7] 'minimap-mode)
(add-hook 'minimap-sb-mode-hook (lambda () (setq mode-line-format nil)))

(use-package anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(setq python-shell-interpreter "python3")
(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))
(add-hook 'python-mode-hook 'anaconda-mode)

(setq line-number-mode t)
(setq column-number-mode t)

(require 'cc-mode)
(require 'company)
(require 'company-c-headers)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)


(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(setq company-backends (delete 'company-semantic company-backends))

(add-to-list 'company-backends 'company-c-headers)
;;(add-to-list 'company-c-headers-path-system "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.3.0/../../../../include/c++/7.3.0/")  
(add-to-list 'company-c-headers-path-system "/usr/include/c++/7.3.0/")  
   

(setq company-idle-delay 0)
;;(define-key c-mode-map [(tab)] 'company-complete)
;;(define-key c++-mode-map [(tab)] 'company-complete)

 ;; make sure to install libclang-dev
 ;; also make sure to run irony-install-server
