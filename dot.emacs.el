;;; emacs initialization file

(setq debug-on-error t)

(line-number-mode 1)
(column-number-mode 1)

(setq version-control t)
(setq kept-new-versions 99)
(setq kept-old-versions 10)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; (autoload 'gfm-mode "markdown-mode"
;;    "Major mode for editing GitHub Flavored Markdown files" t)


;; (add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))



(setq dropbox 
      (cond ((file-exists-p "/home/larry/winhome/Dropbox")
	     "/home/larry/winhome/Dropbox")
	    ((file-exists-p "/mnt/h/My Drive/emacs")
	     "/mnt/h/My Drive/")
	    ((file-exists-p "/mnt/g/My Drive/emacs")
	     "/mnt/g/My Drive/")
	    (t "~/dropbox")))
(add-to-list 'load-path (expand-file-name (concat dropbox "/emacs")))

       
; mud
(autoload 'mud "mud" "call a mud" t)
(setq mud-entry-file (expand-file-name (concat dropbox "/emacs/mudlist")))

;; space in filenames
(cond ((boundp 'minibuffer-local-filename-completion-map)
       (define-key minibuffer-local-filename-completion-map " "
	 'minibuffer-complete-word)
       ))

; Emails
(setq user-full-name "Larry Masinter")
(setq user-mail-address "LMM@acm.org")

;; font size
(defun big ()
  (interactive)
  (set-frame-font "-*-Courier New-bold-r-*-*-15-82-*-*-c-*-*-ansi-"))

(defun small ()
  (interactive)
  (set-frame-font "-*-Courier New-normal-r-*-*-09-82-*-*-c-*-*-ansi-"))





;; IRC
(setq erc-server "irc.w3.org")
(setq erc-port 6665)

(random t) ; initialize when starting
(defun pick (&rest choices)
  (elt choices (random (length choices))))

(setq inhibit-startup-screen t)
