(setq debug-on-error t)
(cond ((file-exists-p "~/homedir/.emacs")
       (load "~/homedir/.emacs"))
      ((file-exists-p "~/dropbox/emacs/init.el")
       (load "~/dropbox/emacs/init"))
      ((file-exists-p "c:/users/masinter/Dropbox/emacs/init.el")
       (load "c:/users/masinter/Dropbox/emacs/init"))
      ((file-exists-p "c:/users/Larry/Google Drive/emacs/init.el")
       (load "c:/users/Larry/Google Drive/emacs/init"))
      ((file-exists-p "c:/users/Larry/Dropbox/emacs/init.el")
       (load "c:/users/Larry/Dropbox/emacs/init")
))