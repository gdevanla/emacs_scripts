;; Use at your own risk!!
;; add the following lines to .emacs file.
;; When a function header needs to be generated, place the cursor
;; on the same line as function definition and call the function
;; generate-header. Alternatively, a key-binding can be added
;; using (global-set-key) or adding this function to the python-mode-hook
;; this method also assume the python-mode is on though
;; it could be run even when not in python mode.
;; TODO: Test for python-mode specifically

(defun get-function-definition(sentence)
  (message sentence)
  (if (string-match "def.*(.*):" sentence)
      (match-string 0 sentence))
  )

(defun get-parameters(sentence)
        (setq y (get-function-definition sentence))
        (message y)
        (if y
            (if (string-match "(.*)"  y)
             (match-string 0 y)))
        )


(require 'thingatpt)
(defun generate-header()
    (interactive)
    (setq p (get-parameters (thing-at-point 'sentence)))
    (forward-line 1)
    (insert "\t\"\"\"\n\n\n")
    (setq params (split-string p "[?\,?\(?\)?\ ]"))
    (while params
        (if (/= (length (chomp (car params))) 0)
        (progn
            (insert "\t:param ")
            (insert (chomp (car params)))
            (insert ": \n")))
        (setq params (cdr params)))
        (insert "\n\t\"\"\"\n\n")
    )
