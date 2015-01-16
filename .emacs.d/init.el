;;; init.el --- 

;; Copyright (C) 2010, 2011, 2012, 2013, 2014, 2015 Evgeny Boykov
;;
;; Author: artscan@list.ru
;; Keywords: init, dotemacs
;; Requirements: 
;; Status: not intended to be distributed yet

;; Load bootstrap.el
(load (concat user-emacs-directory "lisp/bootstrap.el"))

;; Add eab-misc
(if (not (el-get-package-installed-p 'eab-misc))
    (el-get 'sync '(eab-misc)))

;; Load dotemacs.el
(load (concat user-emacs-directory "el-get/eab-misc/dotemacs.el"))

(setq dotemacs-loaded-ok nil)

(if dotemacs-loaded-ok (kill-emacs))
