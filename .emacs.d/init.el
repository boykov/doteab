;;; init.el --- 

;; Copyright (C) 2010, 2011, 2012, 2013, 2014, 2015 Evgeny Boykov
;;
;; Author: artscan@list.ru
;; Keywords: init, dotemacs
;; Requirements: 
;; Status: not intended to be distributed yet

;; Load bootstrap.el
(load (concat user-emacs-directory "lisp/bootstrap.el"))

;; Load dotemacs.el
(load (concat user-emacs-directory "el-get/eab-misc/dotemacs.el"))

(dotemacs-load-children '("lisp/packages"))

(el-get 'sync eab/el-get-sources)

(dotemacs-load-children '("el-get/eab-dotemacs/eab-kbd"))

