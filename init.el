

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

  
(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
