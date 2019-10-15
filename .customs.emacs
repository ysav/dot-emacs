;;
;; File  .customs.emacs - These commands are executed when the GNU emacs init.el file
;;                        loads the file.
;;

;; Comment out this line if debug of customs.emacs is not required
(setq debug-on-error t)

;;(add-to-list 'load-path "~/.emacs.d/site-lisp/")

;; Package manager
(require 'package)
(add-to-list 'package-archives'
	     ("melpa" . "http://melpa.org/packages/") t)

;; Known issue wioth https support for emacs on windows so commenetd out for now
;; (require 'package)
;; (add-to-list 'package-archives'
;; 	     ("org" . "https://orgmode.org/elpa/") t)

(package-initialize)

;; Uncomment to cause refresh of package content
;;(package-refresh-contents)

;; Attempt to conditionally force package refresh doesn't work 
;;(when (not package-archive-contents)
;;  (package-refresh-contents))

(defvar myPackages
  '(elpy
    ))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; For dired-x
;; Especially useful extension for omitting uninteresting files
;; Un-omit with C-x M-o
;; see here : http://www.gnu.org/software/emacs/manual/html_node/dired-x/index.html#Top
(require 'dired-x)
(setq-default dired-omit-files-p t) ; Buffer-local variable
(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$")) ; Dot-files

;; For org-mode
;; - auto-open .org files in org mode
;; - map convenient short-cut keys 
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; - for eisenhower matrix of urgent/important items
;;   appears automatically in agenda view
;;   use i or u on TODO item to assign a tag to items
(setq org-tag-alist '(("important" . ?i)
		      ("urgent"    . ?u)))

(setq org-agenda-custom-commands
   '(("1" "Q1" tags-todo "+important+urgent")
     ("2" "Q2" tags-todo "+important-urgent")
     ("3" "Q3" tags-todo "-important+urgent")
     ("4" "Q4" tags-todo "-important-urgent")))

;; tex fragment support (not working)
(require 'org)
(require 'ox-latex)
(setq org-latex-create-formula-image-program 'dvipng)
;;(setq org-latex-create-formula-image-program 'imagemagick)
(org-babel-do-load-languages 'org-babel-load-languages '((latex . t)))

;; latex preview pane
;; (add-hook 'LaTeX-mode-hook 'latex-preview-pane-mode)
;; (latex-preview-pane-enable)

;; Appearance
;; First must have downloaded to ~.emacs.d with Curl
;; e.g. curl -LO https://raw.githubusercontent.com/emacs-jp/replace-colorthemes/master/aalto-dark-theme.el
;; see https://github.com/emacs-jp/replace-colorthemes/tree/42a79266f1d7b473e9328e67a455e505e6c3eff5
(require 'color-theme-modern)
;; (load-theme 'aalto-dark t t)
;; (enable-theme 'aalto-dark)
(load-theme 'desert t t)
(enable-theme 'desert)



;; Define key sequences for easier access to M-x
;; These allow C-x\C-m and C-c\C-m
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; Map C-w to backward-kill-word for fast delete / retype
;; re-map kill-region so can still access
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; to allow uppercsee UTF-8 encoding specifier at start of python files
(define-coding-system-alias 'UTF-8 'utf-8)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(elpy-enable)            ;; enable elpy for python dev env
(global-linum-mode t) ;; enable line numbers globally
(menu-bar-mode -1)    ;; disable menu-bar
(tool-bar-mode -1)    ;; disable tool-bar
(scroll-bar-mode -1)  ;; disable scroll-bar
;; init.el ends here

