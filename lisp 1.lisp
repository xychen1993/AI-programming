(defun has-number-p (obj) 
  (cond 
   ((atom obj) (numberp obj))
   (t (some 'has-number-p obj))))

