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
(setq el-get-git-install-url (concat eab/homedir-cache "/el-get"))
(setq eab/elparcp-path (concat (getenv "HOME") "/cache/elparcp"))
(setq eab/eabrecipes-path (concat user-emacs-directory "eabrecipes/cache"))
(setq dotemacs-children-prefix user-emacs-directory)


(setq dotemacs-loaded-ok nil)
(defun eab/loaded-ok ()
  (if dotemacs-loaded-ok
      (kill-emacs)
    (progn
      (shell-command "echo > $HOME/dotemacs.error")
      (kill-emacs))))

(add-to-list 'load-path (concat user-emacs-directory "el-get/el-get"))
(unless (require 'el-get nil t)
  (setq el-get-install-branch "master")
  (switch-to-buffer
   (url-retrieve-synchronously
    eab/el-get-install-path))
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
      (list (file-name-as-directory package-user-dir)))
;; Add eab-misc
(if (not (el-get-package-installed-p 'eab-misc))
    (el-get 'sync '(eab-misc)))

(if (not (file-exists-p eab/elparcp-path))
    (progn
      (make-directory eab/elparcp-path)
      (el-get-elpa-build-local-recipes eab/elparcp-path)))

;; elpa recipes and eabrecipes only
(setq el-get-recipe-path nil)
(add-to-list 'el-get-recipe-path eab/elparcp-path)
(add-to-list 'el-get-recipe-path eab/eabrecipes-path)


