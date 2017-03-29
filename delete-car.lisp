(defun delete-car (lst)
  (cond ((null (cdr lst)) nil)
        ((consp (cdr lst)) (setf (car lst) (cadr lst) (cdr lst) (cddr lst)) lst)
        (t (cdr lst))))