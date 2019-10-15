
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq ring-bell-function 'ignore)

;; Finally look for .customs.emacs file and load it if found
(if "~/.emacs.d/.customs.emacs" 
   (load "~/.emacs.d/.customs.emacs" t t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" ".venv")))
 '(inhibit-startup-screen t)
 '(markdown-command "pandoc")
 '(org-agenda-files
   (quote
    ("c:/repo/rmunro/notes/dates/2019-july.org")))
 '(package-selected-packages
   (quote
    (virtualenvwrapper latex-preview-pane material-theme markdown-mode magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
