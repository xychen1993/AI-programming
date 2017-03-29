(defun horner (x &rest parms)
  (reduce (lambda (a b) (+ (* x a) b)) parms))