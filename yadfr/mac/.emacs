(setq default-frame-alist (append (list
  '(width  . 81)  ; Width set to 81 characters
  '(height . 60)) ; Height set to 60 lines
  default-frame-alist))


;; these were generated by Emacs GUI
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(font-latex-fontify-sectioning (quote color))
 '(tab-width 2))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width semi-condensed :foundry "unknown" :family "DejaVu Serif")))))



;; ====Configuration from
;; http://homepages.inf.ed.ac.uk/s0243221/emacs/
(setq inhibit-startup-message   t)   ; Don't want any startup message
(setq make-backup-files         t) ; Don't want any backup files

(setq search-highlight           t) ; Highlight search object
(setq query-replace-highlight    t) ; Highlight query object
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening

(set-face-background 'region "yellow") ; Set region background color
(set-default-font "-adobe-courier-small-r-normal--18-180-75-75-m-110-iso8859-1")

 (add-to-list 'load-path "~/.emacs.d/vendor/")


;;(add-hook 'python-mode-hook
;;      (lambda ()
;;        (setq indent-tabs-mode t)
;;        (setq tab-width 2)
;;        (setq python-indent 2)))

;; to set fonts
(setq my-font "Monospace-10")
(set-default-font my-font)


;; ==== Put autosave and backup files in ~/.emacs.d ====

;; Thanks to
;; http://stackoverflow.com/questions/2020941/emacs-newbie-how-can-i-hide-the-buffer-files-that-emacs-creates
;;
;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.

(defvar backup-dir (expand-file-name "~/.emacs.d/backup/"))
(defvar autosave-dir (expand-file-name "~/.emacs.d/autosave/"))
(setq backup-directory-alist (list (cons ".*" backup-dir)))
(setq auto-save-list-file-prefix autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosave/" t)
(make-directory "~/.emacs.d/backup/" t)


;; ===== Automatically load abbreviations table =====

;; Note that emacs chooses, by default, the filename
;; "~/.abbrev_defs", so don't try to be too clever
;; by changing its name

;;(setq-default abbrev-mode t)
;;(read-abbrev-file "~/.abbrev_defs")
;;(setq save-abbrevs t)

;; ===== Set the highlight current line minor mode =====

;; In every buffer, the line which contains the cursor will be fully
;; highlighted

(global-hl-line-mode 1)

;; ===== Set standard indent to 2 rather that 4 ====
(setq standard-indent 2)

;; ========== Line by line scrolling ==========

;; This makes the buffer scroll by only a single line when the up or
;; down cursor keys push the cursor (tool-bar-mode) outside the
;; buffer. The standard emacs behaviour is to reposition the cursor in
;; the center of the screen, but this can make the scrolling confusing

(setq scroll-step 1)

;; Show column-number in the mode line

(column-number-mode 1)


;; ===== Use four spaces instead of tabs ====

(setq c-basic-offset 4)
(setq tab-width 4)
(setq-default tab-width 4)

(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(setq-default indent-line-function 'insert-tab)
(setq indent-line-function 'insert-tab)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76
                        80))
(setq-default py-indent-offset 4)
(setq-default python-indent 4)

;; ===== Trailing whitespace ======

(setq-default highlight-trailing-whitespace)

;; ===== Highlight Marked Text =====

(setq-default transient-mark-mode t)



;; ========== Enable Line and Column Numbering ==========

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; ========== Set the fill column ==========
(setq-default fill-column 78)

;; ===== Turn on Auto Fill mode automatically in all modes =====

;; Auto-fill-mode the the automatic wrapping of lines and insertion of
;; newlines when the cursor goes over the column limit.

;; This should actually turn on auto-fill-mode by default in all major
;; modes. The other way to do this is to turn on the fill for specific modes
;; via hooks.

(setq auto-fill-mode 1)

;; ========= Set colours ==========

;; Set cursor and mouse-pointer colours
(set-cursor-color "red")
(set-mouse-color "goldenrod")

;; Set region background colour
(set-face-background 'region "blue")

;; Set emacs background colour
(set-background-color "black")
(set-foreground-color "white")


;;https://github.com/asmeurer/dotfiles/blob/master/.emacs

;; ===== Automatically indent with RET =====
(define-key global-map (kbd "RET") 'newline-and-indent)


;; TODO: kill-whole-line kills a newline too, which I don't like. So write a
;; custom routine.
(defun kill-total-line ()
    (interactive)
    (let ((kill-whole-line t))
      (end-of-line)
      (kill-line 0)
      )
    )

(global-set-key [f7] 'kill-total-line)


;; define the function to kill the characters from the cursor
;; to the beginning of the current line
(defun backward-kill-line (arg)
    "Kill chars backward until encountering the end of a line."
      (interactive "p")
        (kill-line 0))

;; I don't use C-u's normal use, but I do use this macro.

;;(GLOBAL-SET-KEY "\C-U" 'BACKWARD-KILL-LINE)

;; You can still get the original meaning of C-u (universal-argument) with C-c
;; u.  Note, I was going to do C-S-u, but apparently terminals can't
;; distinguish the shift with control

(global-set-key (kbd "C-c u") 'universal-argument)

;; Disable all the version control stuff
;; Makes emacs load much faster inside git repos

(setq vc-handled-backe:nds nil)


;; Use the turn-on-flyspell one to enable it everywhere, and the
;; flyspell-prog-mode to enable it only in comments/strings
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(add-hook 'message-mode-hook 'turn-on-flyspell)
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)
(add-hook 'c-mode-common-hook 'flyspell-prog-mode)
(add-hook 'tcl-mode-hook 'flyspell-prog-mode)
(add-hook 'python-mode-hook 'flyspell-prog-mode)
(add-hook 'lisp-mode-hook 'flyspell-prog-mode)
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)
(defun turn-on-flyspell ()
  "Force flyspell-mode on using a positive arg.  For use in hooks."
  (interactive)
  (flyspell-mode 1))



;; This trick makes C-x C-s clear whitespace, *but*, if there was whitespace
;; between the cursor and the end of the line, it puts it back after the save
;; (but still marks the file as saved).  This way, you can save while typing
;; and it won't move the cursor back into the word you just typed if you had a
;; space there, but it always clears whitespace in the saved file.
;; Additionally, this makes C-x C-s clear whitespace even if no changes have
;; been made to the file yet.  To save a file without clearing whitespace, use
;; M-x save-buffer.

(defun my-save-buffer-dtws (arg)
  "save buffer delete trailing white space, preserve white space before
    point if point is past text"
  (interactive "p")
  (let ((save (when (and (looking-at "\\s-*$")
                         (looking-back "\\s-+"
                                       (line-beginning-position) t))
                (match-string 0))))
    (delete-trailing-whitespace)
    (save-buffer arg)
    (when save
      (insert save)
      (set-buffer-modified-p nil))))

(global-set-key [remap save-buffer] 'my-save-buffer-dtws)

;; Normally you would just do this:

;;(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'message-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(add-hook 'c-mode-common-hook 'turn-on-auto-fill)
(add-hook 'tcl-mode-hook 'turn-on-auto-fill)
(add-hook 'python-mode-hook 'turn-on-auto-fill)
(add-hook 'lisp-mode-hook 'turn-on-auto-fill)
(add-hook 'emacs-lisp-mode-hook 'turn-on-auto-fill)
(add-hook 'markdown-mode-hook 'turn-on-auto-fill)



;; Setting up more python-mode features
;; http://jesselegg.com/archives/2010/02/25/emacs-python-programmers-part-1/




;; disable default python.el from loading
(require 'python-mode)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(require 'ipython)
;;(require 'pymacs)
;;(pymacs-load "ropemacs" "rope-")


;; The following lazily enables ropemacs (and only loads pymacs with it).
;; Use C-x p l to load ropemacs.  Uncomment the stuff below it to always load them (slow).

(defun load-ropemacs ()
  "Load pymacs and ropemacs"
  (interactive)
  (require 'pymacs)
  (pymacs-load "ropemacs" "rope-")
                  ;; Automatically save project python buffers before refactorings
  (setq ropemacs-confirm-saving 'nil)
  )
(global-set-key "\C-xpl" 'load-ropemacs)

;; ;; ===== Stuff for the pymacs extension ====
;;
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

;;
;; ;; ===== Enable ropemacs =====
;;
;; ;; Uncomment these to prevent ropemacs from changing default keybindings
(setq ropemacs-enable-shortcuts nil)
(setq ropemacs-local-prefix "C-c C-p")
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

;; ;; ===== Enable the anything extension ====
;;
(require 'anything)
 (require 'anything-ipython)
 (when (require 'anything-show-completion nil t)
    (use-anything-show-completion 'anything-ipython-complete
                                  '(length initial-pattern)))


;;python_mode.el settings
;;http://pedrokroger.com/2010/07/configuring-emacs-as-a-python-ide-2/


;;http://www.joegrossberg.com/archives/000182.html
;; recentf stuff
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\\C-r" 'recentf-open-files)

;; setting for popping mark rings autimatically
(setq set-mark-command-repeat-pop t)

;; https://sites.google.com/site/steveyegge2/effective-emacs
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; note \C-w may have side effects outside emacs
(global-set-key "\C-x\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; disable menu bars
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; shortcut for query-replace
 (defalias 'qrr 'query-replace-regexp)

;; restrict emacs to only open from existing buffers when I
;; use C-x b

(defadvice switch-to-buffer (before existing-buffer activate compile)
  "When interactive switch to existing buffers only unless given a Prefix
argument"
  (interactive
   (list (read-buffer "Switch to buffer: "
                      (other-buffer)
                      (null current-prefix-arg))
         )))

;; for intercation between emacs and X11 clipboard.
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)



;; settings to use org-mode for research

(defun org-mode-reftex-search ()
  ;;jump to the notes for the paper pointed to at from reftex search
  (interactive)
  (org-open-link-from-string (format "[[notes:%s]]" (reftex-citation t))))

(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name) (file-exists-p (buffer-file-name))
       (progn
	 ;enable auto-revert-mode to update reftex when bibtex file changes on disk
	 (global-auto-revert-mode t)
	 (reftex-parse-all)
	 ;add a custom reftex cite format to insert links
	 (reftex-set-cite-format
	  '((?b . "[[bib:%l][%l-bib]]")
	    (?n . "[[notes:%l][%l-notes]]")
	    (?p . "[[papers:%l][%l-paper]]")
	    (?t . "%t")
	    (?h . "** %t\n:PROPERTIES:\n:Custom_ID: %l\n:END:\n[[papers:%l][%l-paper]]")))))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
  (define-key org-mode-map (kbd "C-c (") 'org-mode-reftex-search))

(add-hook 'org-mode-hook 'org-mode-reftex-setup)

(setq org-link-abbrev-alist
      '(("bib" . "~/Dropbox/private/research/refs.bib::%s")
	("notes" . "~/Dropbox/private/research/org/notes.org::#%s")
	("papers" . "~/Dropbox/private/research/papers/%s.pdf")))


(defun my-rtcite-export-handler (path desc format)
  (message "my-rtcite-export-handler is called : path = %s, desc = %s, format = %s" path desc format)
  (let* ((search (when (string-match "::#?\\(.+\\)\\'" path)
                   (match-string 1 path)))
         (path (substring path 0 (match-beginning 0))))
    (cond ((eq format 'latex)
           (if (or (not desc)
                   (equal 0 (search "rtcite:" desc)))
               (format "\\cite{%s}" search)
             (format "\\cite[%s]{%s}" desc search))))))


(require 'org)

(org-add-link-type "rtcite"
                   'org-bibtex-open
                   'my-rtcite-export-handler)


;; orgmode to latex
(require 'org-latex)
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))