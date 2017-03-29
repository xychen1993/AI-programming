(defun show-dots (obj)
  (cond
   ((consp obj) (format t "(~a . " (show-dots (car obj)))
    (show-dots (cdr obj))
    (format t ")"))
   (t (format t "~A" obj))))


(defun show-list (obj)
  (cond 
   ((atom obj) (format t "~A" obj))
   (t (format t "[")
    (show-list (car obj))
    (do ((l (cdr obj) (cdr l)))
        ((atom l) 
         (unless (null l)
           (format t " . ~A" l)))
      (format t " ")
      (show-list (car l)))
    (format t "]"))))



;;passed testcases but haven't done edition
(defun show-list (obj)
  (cond
   ((null obj) (format t "~a" obj))
    ((listp obj) (format t "[")
     (do ((l obj (cdr l)))
         ((or (atom l) (endp l)) 
          (when l (format t ". ~a" l))
          (format t "]"))
       (if (listp l)
           (show-list (car l))
         (show-list l))
       (when (cdr l) (format t " "))))
     (t (format t "~a" obj))))
