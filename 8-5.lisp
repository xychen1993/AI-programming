(defun henley-p (content)
  (let ((features (list (all-lower-p content)
                        (punctuation-feature content)
                        (last-char-feature content))))
    (if (equal content "")
        t
      (>= (length (remove nil features)) 2))))

(defun all-lower-p (content)
  (not (some #'upper-case-p content)))

(defun punctuation-feature (content)
  (or (search " ; " content :test #'string=)
      (search " . " content :test #'string=)
      (search " - " content :test #'string=)
      (search " ? " content :test #'string=)
      (search " , " content :test #'string=)
      (search " ! " content :test #'string=)
      ))

(defun last-char-feature (content)
  (when (> (length content) 0)
    (char= #\Space (char (reverse content) 0))))