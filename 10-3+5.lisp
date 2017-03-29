(defmacro nth-expr (n &body expr)
  `(case ,n
     ,@(let ((i 0))
         (mapcar #'(lambda(x) `(,(incf i) ,x))
           expr))))


(defmacro n-of (n expr)
  (let ((g (gensym))
        (h (gensym)))
    `(let ((,g nil))
       (dotimes (,h ,n)
         (push ,expr ,g))
       (nreverse ,g))))