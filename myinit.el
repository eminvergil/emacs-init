;; menu tool bar
(setq inhibit-startup-message t)
(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(menu-bar-mode 1)
(tool-bar-mode 0)
(ido-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)

(defalias 'list-buffers 'ibuffer)

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(setq org-agenda-files (list "c:/Users/emin/Desktop/org/habits.org"
			     "c:/Users/emin/Desktop/org/code.org"
			     "c:/Users/emin/Desktop/org/music.org" 
			     "c:/Users/emin/Desktop/org/home.org" 
			     "c:/Users/emin/Desktop/org/sınav.org"  
 ;;                           "~/org/school.org" 
                             ;;"~/org/home.org"
			     ))
(setq org-agenda-custom-commands
      '(("h" "Daily habits" 
         ((agenda ""))
         ((org-agenda-show-log t)
          (org-agenda-ndays 7)
          (org-agenda-log-mode-items '(state))
          (org-agenda-skip-function '(org-agenda-skip-entry-if 'notregexp ":HABITS:"))))
        ;; other commands here
        ))

;; Enable org-habit
 (add-to-list 'org-modules 'org-habit)
 (require 'org-habit)
 (setq org-habit-show-all-today t
       org-habit-show-habits-only-for-today t
       org-habit-show-done-always-green t
       org-habit-graph-column 40
       org-habit-preceding-days 28
       org-habit-following-days 7)

(use-package htmlize
  :ensure t)

(use-package org
    :ensure t
    :pin org)

(use-package org-protocol
    :ensure nil)

(use-package org-bullets
  :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Set Keybindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; Set Preferences
(setq org-completion-use-ido nil
      org-src-fontify-natively t
      org-src-tab-acts-natively t
      org-confirm-babel-evaluate nil
      org-startup-with-inline-images t
      org-edit-src-content-indentation 0)

(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f" "xelatex -interaction nonstopmode %f"))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "PROGRESS(n)" "|" "DONE(d)")
	      (sequence "WAITING(w@/!)" "|" "CANCELLED(c@/!)" "SOMEDAY(s@/!)"))))

(setq org-todo-keywords-faces
      (quote (("TODO" :foreground  "red" :weight bold)
	      ("PROGRESS" :foreground  "blue" :weight bold)
	      ("DONE" :foreground  "forest green" :weight bold)
	      ("WAITING" :foreground  "orange" :weight bold)
	      ("CANCELLED" :foreground  "forest green" :weight bold)
	      ("SOMEDAY" :foreground  "forest green" :weight bold))))

;; bunu tam anlamadım 
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

(setq org-directory (expand-file-name "c:/Users/emin/Desktop/org/" ))

(setq org-capture-templates `(

  ("c" "Code Tasks" entry (file+headline ,(concat org-directory "code.org") "Code")
                     "* TODO %?\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a>>\")\n%U\n%a\n" :clock-in t :clock-resume t)
  
  
  ("t" "Home Tasks" entry (file+headline ,(concat org-directory "home.org") "Home")
                     "* TODO %?\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a>>\")\n%U\n%a\n" :clock-in t :clock-resume t)

  

  ("m" "Music Tasks" entry (file+headline ,(concat org-directory "music.org") "Music")
                     "* TODO %?\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a>>\")\n%U\n%a\n" :clock-in t :clock-resume t)

  ("s" "Sınav Tasks" entry (file+headline ,(concat org-directory "sınav.org") "Sınav")
                     "* TODO %?\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a>>\")\n%U\n%a\n" :clock-in t :clock-resume t)


  ("w" "Hikaye yazi" entry (file+datetree ,(concat org-directory "writing.org") "HIKAYE")
               "* %?" empty-line 1 :clock-in t :clock-resume t)

  
  ("f" "Some stuff" entry (file ,(concat org-directory "stuff.org"))
               "* %?" empty-line 1 )


  ("g" "Journal entry" entry (file+datetree ,(concat org-directory "gunluk.org") "Gunluk")
               "* %?\n%U\n" :clock-in t :clock-resume t)
  
  ("h" "Habit " entry (file+headline ,(concat org-directory "habits.org") "Habits")
   "* TODO %?\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a +1w>>\")\n:PROPERTIES:\n:STYLE: habit\n:END:\n")

   ))

;; theme stuff
(use-package sublime-themes
  :ensure t)

(load-theme 'spolsky t)
;;spolsky
;;wilson
;;graham

(use-package pdf-tools
:ensure t)

(use-package org-pdfview
:ensure t)

; Make babel results blocks lowercase
(setq org-babel-results-keyword "results")

(defun bh/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))


(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (python . t)
         (gnuplot . t)
	 (ditaa . t)
         (org . t)
         (latex . t))))
