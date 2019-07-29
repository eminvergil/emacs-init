;; menu tool bar
(setq inhibit-startup-message t)
(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(menu-bar-mode 1)
(tool-bar-mode 0)
(ido-mode 1)

(defalias 'list-buffers 'ibuffer)

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

;; theme stuff
(use-package sublime-themes
  :ensure t)

(load-theme 'graham t)
;;spolsky
;;wilson

(use-package pdf-tools
:ensure t
:config
(pdf-tools-install))

(use-package org-pdfview
:ensure t)
