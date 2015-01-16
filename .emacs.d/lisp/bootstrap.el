;;; bootstrap.el --- 

;; Copyright (C) 2010, 2011, 2012, 2013, 2014, 2015 Evgeny Boykov
;;
;; Author: artscan@list.ru
;; Keywords: bootstrap, dotemacs
;; Requirements: el-get
;; Status: not intended to be distributed yet

(add-to-list 'load-path (concat user-emacs-directory "el-get/el-get"))

(setq el-get-emacswiki-elisp-file-list-url (concat "file://" (getenv "HOME") "/cache/emacswiki.html"))
(setq el-get-git-install-url (concat (getenv "HOME") "/cache/el-get"))

(unless (require 'el-get nil t)
  (setq el-get-install-branch "master")
  (switch-to-buffer
   (url-retrieve-synchronously
    (concat "file://" (getenv "HOME") "/cache/el-get-install.el")))
  (end-of-buffer)
  (eval-print-last-sexp))

(setq package-archives
      '(("melpa" . "http://melpa.milkbox.net/packages/")
	("elpa" . "http://tromey.com/elpa/")
	("gnu" . "http://elpa.gnu.org/packages/")))

(setq package-user-dir
      (expand-file-name
       (convert-standard-filename
	(concat
	 (file-name-as-directory
	  (el-get-package-directory "package"))
	 "elpa")))
      package-directory-list
      (list
       (file-name-as-directory package-user-dir)
       "/usr/share/emacs/site-lisp/elpa/"))

(if (not (file-exists-p (concat (getenv "HOME") "/cache/elparcp")))
    (progn
      (make-directory (concat (getenv "HOME") "/cache/elparcp"))
      (el-get-elpa-build-local-recipes (concat (getenv "HOME") "/cache/elparcp"))))

(setq el-get-recipe-path nil)
(add-to-list 'el-get-recipe-path (concat (getenv "HOME") "/cache/elparcp"))
(add-to-list 'el-get-recipe-path (concat user-emacs-directory "eabrecipes/cache"))

(if (not (el-get-package-installed-p 'eab-misc))
    (el-get 'sync '(eab-misc)))

