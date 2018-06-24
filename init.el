

;; begin bootstrap
(require 'package)
;; load melpa packages
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
;; consider moving this to myinit.org

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

  
(org-babel-load-file (expand-file-name "~/.emacs.d/readme.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-always-recenter t)
 '(minimap-dedicated-window t)
 '(minimap-hide-fringes t)
 '(minimap-major-modes (quote (org-mode prog-mode)))
 '(minimap-recreate-window t)
 '(minimap-update-delay 0)
 '(minimap-width-fraction 0.1)
 '(minimap-window-location (quote right))
 '(package-selected-packages
   (quote
    (db-pg rainbow-mode diminish company-c-headers company-irony-c-headers minimap sublimity yasnippet-snippets company-anaconda anaconda-mode zenburn-theme which-key use-package try tabbar smartparens rainbow-delimiters powerline org-bullets neotree jedi flycheck elpy counsel color-theme ample-theme afternoon-theme ace-window)))
 '(tabbar-separator (quote (0.5))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 1.0))))
 '(minimap-active-region-background ((t nil)))
 '(mode-line ((t (:background "#14151E" :family "Lucida Grande"))))
 '(powerline-active0 ((t (:inherit mode-line)))))
