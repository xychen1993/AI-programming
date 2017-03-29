(defun make-balance (x)
  #'(lambda (&optional (y 0))
      (incf x y)))