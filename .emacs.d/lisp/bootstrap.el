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

(setq el-get-recipe-path nil)
(add-to-list 'el-get-recipe-path (concat (getenv "HOME") "/cache/elparcp"))
(add-to-list 'el-get-recipe-path (concat (getenv "HOME") "/cache/eabrecipes"))

(if (not (el-get-package-installed-p 'eab-misc))
    (el-get 'sync '(eab-misc)))

