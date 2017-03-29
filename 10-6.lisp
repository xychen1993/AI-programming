(defmacro preserve (lst &body body)
  `(let ,(mapcar #'(lambda (name) `(,name ,name)) lst)
     ,@body))