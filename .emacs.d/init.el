;;; init.el --- 

;; Copyright (C) 2010, 2011, 2012, 2013, 2014, 2015 Evgeny Boykov
;;
;; Author: artscan@list.ru
;; Keywords: init, dotemacs
;; Requirements: 
;; Status: not intended to be distributed yet

(load "/home/eab/git/dotemacs/eab-path.el")

;; Load bootstrap.el
(load (concat user-emacs-directory "bootstrap.el"))

;; Load dotemacs.el
(load (concat user-emacs-directory "el-get/eab-misc/dotemacs.el"))

(dotemacs-load-children '("el-get/eab-dotemacs/eab-packages-minimal"))

(package-refresh-contents)
(package-initialize)

;; (eab/sync-package '(ace-window))

;; (if (featurep 'ace-jump-mode)
;;     (unload-feature 'ace-jump-mode 't))

(dotemacs-load-children '("packages"))

(dotemacs-load-children '("el-get/eab-dotemacs/eab-kbd"))

;; TODO org-babel-safe-header-args
;; похоже, что при прогоне bootstrap сначала загружается из el-get/org (вместо el-get/org-mode)

(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-workgroups2"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-ui-minimal"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-shell"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-shell-utils"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-sauron"))

(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-org"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-org-publish"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-org-agenda"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-org-protocol"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-yasnippet"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-org-src-babel"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-org-todo"))

(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-hron-lib"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-postload-minimal"))

(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-depend-minimal"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-window"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-find-func"))

(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-workflow"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-appt"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-desktop"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-words"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-server"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-git"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-grep"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-dired"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-smex"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-ido"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-auctex"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-org-latex"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-org-reftex"))

(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-wmctrl"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-ido-utils"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-packages"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-popwin"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-miniframe"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-compile"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-browse"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-sudo"))

(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-helm-anything"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-greek-to-latex"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-tags"))

(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-auto-complete"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-ui"))

;; (dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-ace"))

(setq eab/eeansi-path "/home/eab/git/auto/eeansi.sh")
(setq eab/eegchannel-path (expand-file-name (concat user-emacs-directory "el-get/eev-current/eegchannel")))

(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-eepitch"))

(dotemacs-load-children '("el-get/eab-dotemacs/eab-packages"))

;; TODO manual comment problem packages
(el-get 'sync (append
	       eab/package-sources-extra
	       ))

(el-get 'sync (append
	       eab/el-get-sources-extra
	       ))

(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-depend"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-gnus"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-twit"))
(dotemacs-load-children '("el-get/eab-dotemacs/lisp/eab-postload"))
