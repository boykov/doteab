;;; bootstrap.el --- 

;; Copyright (C) 2010, 2011, 2012, 2013, 2014, 2015 Evgeny Boykov
;;
;; Author: artscan@list.ru
;; Keywords: bootstrap, dotemacs
;; Requirements: el-get
;; Status: not intended to be distributed yet

;; see Makefile and ../../cache
(setq eab/homedir-cache (concat (getenv "HOME") "/cache"))
(setq eab/el-get-install-path (concat "file://" eab/homedir-cache "/el-get-install.el"))
;; TODO this cached url doesn't work: failed to retrieve
(setq el-get-emacswiki-elisp-file-list-url (concat "file://" eab/homedir-cache "/emacswiki.html"))
(setq el-get-git-install-url (concat eab/homedir-cache "/el-getmirror/el-get"))
(setq eab/elparcp-path (concat (getenv "HOME") "/cache/elparcp"))
(setq eab/eabrecipes-path (concat user-emacs-directory "eabrecipes/cache"))
(setq dotemacs-children-prefix user-emacs-directory)

(add-to-list 'load-path (concat user-emacs-directory "el-get/el-get"))
(unless (require 'el-get nil t)
  (setq el-get-install-branch "master")
  (switch-to-buffer
   (url-retrieve-synchronously
    eab/el-get-install-path))
  (end-of-buffer)
  (eval-print-last-sexp))

;; elpa recipes and eabrecipes only
(setq el-get-recipe-path nil)
(add-to-list 'el-get-recipe-path eab/eabrecipes-path)

;; Fix bug auctex-11.87.7 with .loaddefs.el: can't load tex-site (needs relative path)
(add-to-list 'load-path (concat user-emacs-directory "el-get/auctex"))

;; Add package.rcp from eabrecipes (before elparcp!)
;; Add eab-misc
(el-get 'sync '(eab-misc
		package
		eab-dotemacs))

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") 'append)

(setq package-archives `(("myelpa" . ,(concat eab/homedir-cache "/elpamirror/"))))

;; Create elparcp: package-archives loaded from package.rcp
(if (not (file-exists-p eab/elparcp-path))
    (progn
      (make-directory eab/elparcp-path)
      (el-get-elpa-build-local-recipes eab/elparcp-path)))

;; Add elparcp
(setq el-get-recipe-path nil)
(add-to-list 'el-get-recipe-path eab/elparcp-path)
(add-to-list 'el-get-recipe-path eab/eabrecipes-path)

(defun eab/loaded-ok ()
  (if dotemacs-loaded-ok
      (kill-emacs)
    (progn
      (shell-command "echo > $HOME/dotemacs.error")
      (kill-emacs))))
(setq dotemacs-loaded-ok nil)

(defun eab/sync-package (package-sources)
  "DOCSTRING"
  (interactive)
  (mapcar (lambda (p)
	     (unless (package-installed-p p)
	       (package-install p)))
	  package-sources))

