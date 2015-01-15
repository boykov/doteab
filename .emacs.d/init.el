;;; init.el --- 

;; Copyright (C) 2010, 2011, 2012, 2013, 2014, 2015 Evgeny Boykov
;;
;; Author: artscan@list.ru
;; Keywords: init, dotemacs
;; Requirements: 
;; Status: not intended to be distributed yet

(load (concat user-emacs-directory "lisp/bootstrap.el"))

;; Load dotemacs.el
(setq dotfiles-dir user-emacs-directory)
(setq dotemacs-children-prefix dotfiles-dir)
(load (concat dotfiles-dir "el-get/eab-misc/dotemacs.el"))

(setq dotemacs-loaded-ok nil)

(if dotemacs-loaded-ok (kill-emacs))
