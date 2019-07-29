
(setq inhibit-startup-message t)

(menu-bar-mode 1)
(tool-bar-mode 0)


(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Bootstrap 'use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))


;; Org-mode stufff

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

