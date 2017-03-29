(defstruct (tconc (:constructor new-tconc))
  (head nil)
  (tail nil))

(defun tconc (tconc-structure &rest obj) 
  (cond ((null obj) nil)
        ((null (tconc-head tconc-structure)) (setf (tconc-head tconc-structure) obj)
         (setf (tconc-tail tconc-structure) (last obj)))
        (t (setf (cdr (tconc-tail tconc-structure)) obj)
           (setf (tconc-tail tconc-structure) (last obj))))
  (tconc-head tconc-structure))

(defun make-tconc (&optional l)
  (let ((tc (new-tconc)))
    (setf (slot-value tc 'tail) (last l))
    (setf (slot-value tc 'head) l)
    tc))

(defun tconc-list (tconc-structure &optional l)
  (apply 'tconc tconc-structure l))


