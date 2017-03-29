(defun make-change (x &optional (l '(25 10 5 1)))
  (values-list (coins x l)))

(defun coins (x &optional (l '(25 10 5 1)))
  (if (endp l) 
      nil
    (multiple-value-bind (quotient remainder) (floor x (car l))
      (cons quotient (coins remainder (cdr l))))))

