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
			     "c:/Users/emin/Desktop/org/sinav.org"  
 ;;                           "~/org/school.org" 
                             ;;"~/org/home.org"
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

;;ilki bu
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

;;"c:/Users/emin/Desktop/notlar/yazi"

(setq org-capture-templates `(

  ("c" "Code Tasks" entry (file+headline ,(concat org-directory "code.org") "Code")
                     "* TODO %?:tag:\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a>>\")\n%U\n%a\n" :clock-in t :clock-resume t)
  
  
  ("t" "Home Tasks" entry (file+headline ,(concat org-directory "home.org") "Home")
                     "* TODO %?:tag:\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a>>\")\n%U\n%a\n" :clock-in t :clock-resume t)

  

  ("m" "Music Tasks" entry (file+headline ,(concat org-directory "music.org") "Music")
                     "* TODO %?:tag:\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a>>\")\n%U\n%a\n" :clock-in t :clock-resume t)

  ("s" "Sınav Tasks" entry (file+headline ,(concat org-directory "sinav.org") "Sınav")
                     "* TODO %?:tag:\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a>>\")\n%U\n%a\n" :clock-in t :clock-resume t)


  ("w" "Hikaye yazi" entry (file+headline ,(concat "" "c:/Users/emin/Desktop/notlar/yazi/writing.org") "HIKAYE")
               "* %?:tag:" empty-line 1 :clock-in t :clock-resume t)

  
  ("f" "Some stuff" entry (file ,(concat org-directory "stuff.org"))
               "* %?" empty-line 1 )


  ("g" "Journal entry" entry (file+datetree ,(concat "" "c:/Users/emin/Desktop/notlar/yazi/gunluk.org") "Gunluk")
               "* %?\n%U\n" :clock-in t :clock-resume t)

  ("r" "Weekly entry" entry (file+datetree ,(concat "" "c:/Users/emin/Desktop/notlar/yazi/weekly.org") "Haftalik")
               "* %?\n%U\n" :clock-in t :clock-resume t)
  
  ("h" "Habit " entry (file+headline ,(concat org-directory "habits.org") "Habits")
   "* TODO %?\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a +1w>>\")\n:PROPERTIES:\n:STYLE: habit\n:END:\n")

   ))

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

;; Set default column view headings: Task Total-Time Time-Stamp
(setq org-columns-default-format "%50ITEM(Task) %10CLOCKSUM %16TIMESTAMP_IA")
;; bunu ayarladıktan sonra
;; cc cx cc yaparak butun harcanan sureler olculebilir
;; tabi basta
;; cc cx ci
;; cc cx co
;; ile sure tuttuktan sonrau bu ustteki tablo halinde gormemizi saglio.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;	("p" "List Non-done projects"
;;          tags "+PROJECT+TODO=\"TODO\"")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-agenda-skip-scheduled-if-done nil)

(setq org-agenda-custom-commands
      '(
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	("q" agenda "habits and todos"
	 ((org-agenda-span 1)
	  (org-agenda-skip-scheduled-if-done t)
	  (org-scheduled-past-days 0)
	  (org-deadline-warnings 0))
	 tags("+HABITS+TODO=\"TODO\""))
	  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;	("z" "List Non-done projects"
;;	 ((agenda "" ((org-agenda-span 1)
;;		      (org-habit-toggle-habits)
;;		      (org-scheduled-past-days 0)))
;;        tags "+HABITS+TODO=\"TODO\""))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	("p" agenda "ONLY HABITS"
	 ((org-agenda-ndays 1)
	  (org-scheduled-past-days 0)
	  (org-deadline-warnings 0)
	  (org-agenda-filter-preset '("+HABITS"))
	  ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	("W" "Weekly Review"
         ((agenda "" ((org-agenda-span 7))); review upcoming deadlines and appointments
                                           ; type "l" in the agenda to review logged items 
          (todo "SOMEDAY")
	  (todo "PROGRESS")
	  (todo "CANCELLED") ; review all projects (assuming you use todo keywords to designate projects)
          (todo "DONE") ; review someday/maybe items
          (todo "WAITING"))) ; review waiting items
	))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun air-pop-to-org-agenda (split)
  "Visit the org agenda, in the current window or a SPLIT."
  (interactive "P")
  (org-agenda-list)
  (when (not split)
    (delete-other-windows)))

(define-key global-map (kbd "C-c t a") 'air-pop-to-org-agenda)

(add-to-list 'display-buffer-alist
             `(,(rx string-start "*Calendar*" string-end)
               (display-buffer-below-selected)))

(setq org-habit-graph-column 80)
(setq org-habit-show-habits-only-for-today t)
(setq org-agenda-view-columns-initially nil)
(setq org-agenda-window-setup 'current-window)

;; theme stuff
(use-package sublime-themes
  :ensure t)

(load-theme 'spolsky t)
;;spolsky
;;wilson
;;graham

;;    (use-package auctex
;;      :ensure t)
;;  
;;  (use-package tex
;;      :ensure auctex)

(use-package ox-hugo
  :ensure t            ;Auto-install the package from Melpa (optional)
  )
